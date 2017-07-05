#!/bin/sh
content=$(wget -O- --header=Content-Type:application/json --header="Authorization: $DASPANEL_SYS_UUID" "$DASPANEL_SYS_APISERVER/sites/httpconf/$DASPANEL_SYS_HOSTNAME")
echo "[DASPANEL-LB] INFO Processing site templates for engine: $ENGINE"

# Remove all config of SITES-AVAILBLE FOR this engine
rm /etc/caddy/sites-enabled/*
rm /etc/caddy/sites-available/*

# Generate new configs
echo $content | /opt/daspanel/bin/jq -rc '.[]' | while IFS='' read site;do
    siteuuid=$(echo "$site" | /opt/daspanel/bin/jq -r ._cuid)
    siteenabled=$(echo "$site" | /opt/daspanel/bin/jq -r .enabled)
    configs=$(echo $site | /opt/daspanel/bin/jq -r .configs )
    echo $configs | /opt/daspanel/bin/jq -rc '.[]' | while IFS='' read sitecfg;do
        siteengine=$(echo "$sitecfg" | /opt/daspanel/bin/jq -r .engine)
        #if [ "$siteengine" == "$ENGINE" ]; then
            sitetype=$(echo "$sitecfg" | /opt/daspanel/bin/jq -r .sitetype)
            sitedomain=$(echo "$sitecfg" | /opt/daspanel/bin/jq -r .domain)
            template=""
            template1="/opt/daspanel/data/$DASPANEL_SYS_UUID/conf-templates/$ENGINE/caddy/$sitetype-$siteengine.template"
            template2="/opt/daspanel/conf-templates/$ENGINE/caddy/$sitetype-$siteengine.template"
            template3="/opt/daspanel/conf-templates/$ENGINE/caddy/default.template"
            if [ -f "$template1" ]; then
                template=$template1
            else
                if [ -f "$template2" ]; then
                    template=$template2
                else
                    if [ -f "$template3" ]; then
                        template=$template3
                    else
                        template=""
                        echo "[DASPANEL-LB] FAIL Site $siteuuid missing templates: $template1 OR $template2 OR $template3"
                    fi
                fi
            fi
            if [ ! -z "$template" ]; then
                export SITEINFO=$site
                export SITECFG=$sitecfg
                echo "[DASPANEL-LB] INFO Processing site $siteuuid template: $template"
                /opt/daspanel/bin/gomplate \
                    < $template \
                    >> /etc/caddy/sites-available/$siteuuid.conf

                # Generate certificates redirected domains
                if [ "$sitedomain" != "$DASPANEL_SYS_HOSTNAME" ]; then
                    /opt/daspanel/bin/load-balancer/gen-cert.sh $sitedomain
                fi
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
    /bin/s6-svc -1 /var/run/s6/services/caddy-lb
fi

