#!/bin/sh
export DASPANEL_SYS_HOSTNAME=`cat /opt/daspanel/data/$DASPANEL_SYS_UUID/db/sysconfig.json | /usr/bin/jq -r '.sys.hostname'`
export DASPANEL_SYS_APISERVER=`cat /opt/daspanel/data/$DASPANEL_SYS_UUID/db/sysconfig.json | /usr/bin/jq -r '.sys.apiserver'`
content=$(wget -O- --header=Content-Type:application/json --header="Authorization: $DASPANEL_SYS_UUID" "$DASPANEL_SYS_APISERVER/sites/httpconf/$DASPANEL_SYS_HOSTNAME")
engine=$DASPANEL_HTTP_ENGINE
echo "[DASPANEL-ENGINE] INFO Processing site templates for engine: $engine"

# Remove all config of SITES-AVAILBLE FOR this engine
rm /etc/caddy/sites-enabled/*
rm /etc/caddy/sites-available/*

# Generate new configs
echo $content | jq -rc '.[]' | while IFS='' read site;do
    siteuuid=$(echo "$site" | jq -r ._cuid)
    siteenabled=$(echo "$site" | jq -r .enabled)
    configs=$(echo $site | jq -r .configs )
    echo $configs | jq -rc '.[]' | while IFS='' read sitecfg;do
        siteengine=$(echo "$sitecfg" | jq -r .engine)
        #if [ "$siteengine" == "$engine" ]; then
            sitetype=$(echo "$sitecfg" | jq -r .sitetype)
            template=""
            template1="/opt/daspanel/data/$DASPANEL_SYS_UUID/conf-templates/$engine/caddy/$sitetype-$siteengine.template"
            template2="/opt/daspanel/conf-templates/$engine/caddy/$sitetype-$siteengine.template"
            if [ -f "$template1" ]; then
                template=$template1
            else
                if [ -f "$template2" ]; then
                    template=$template2
                else
                    template=""
                    echo "[DASPANEL-ENGINE] FAIL Site $siteuuid missing templates: $template1 OR $template2"
                fi
            fi
            if [ ! -z "$template" ]; then
                export SITEINFO=$site
                export SITECFG=$sitecfg
                echo "[DASPANEL-ENGINE] INFO Processing site $siteuuid template: $template"
                /usr/bin/gomplate \
                    < $template \
                    >> /etc/caddy/sites-available/$siteuuid.conf
            fi
            # do your processing here
        #else
        #    echo "[DASPANEL-ENGINE] INFO Ignoring templates for site engine: $siteengine"
        #fi
    done
    if [ "$siteenabled" = true ] ; then
        if [ -f "/etc/caddy/sites-enabled/$siteuuid.conf" ]; then
            rm /etc/caddy/sites-enabled/$siteuuid.conf
        fi
        if [ -f "/etc/caddy/sites-available/$siteuuid.conf" ] ; then
            ln -sf /etc/caddy/sites-available/$siteuuid.conf /etc/caddy/sites-enabled/$siteuuid.conf
        fi
    else
        if [ -f "/etc/caddy/sites-enabled/$siteuuid.conf" ]; then
            rm /etc/caddy/sites-enabled/$siteuuid.conf
        fi
    fi
done

if [ -d "/var/run/s6/services/caddy-lb" ]; then
    /bin/s6-svc -h /var/run/s6/services/caddy-lb
fi

