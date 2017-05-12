#!/usr/bin/with-contenv sh
# https://github.com/Fishdrowned/ssl
if [ -z "$1" ]
then
    echo
    echo 'Configure ROOT ca certificate for DASPANEL account'
    echo
    echo 'Usage: configure-rootca.sh <UUID>'
    echo '    <UUID>            DASPANEL instance unique ID'
    exit;
fi
export SYS_UUID="$1"

if [ ! -d "/opt/daspanel/data/$SYS_UUID/certs/self" ]; then
	mkdir -p "/opt/daspanel/data/$SYS_UUID/certs/self"
fi
if [ ! -d "/opt/daspanel/data/$SYS_UUID/certs/self/ca" ]; then
	mkdir -p "/opt/daspanel/data/$SYS_UUID/certs/self/ca"
fi
if [ ! -d "/opt/daspanel/data/$SYS_UUID/certs/self/ca/newcerts" ]; then
	mkdir -p "/opt/daspanel/data/$SYS_UUID/certs/self/ca/newcerts"
fi

if [ ! -f "/opt/daspanel/data/$SYS_UUID/certs/self/ca/index.txt" ]; then
	touch "/opt/daspanel/data/$SYS_UUID/certs/self/ca/index.txt"
fi

if [ ! -f "/opt/daspanel/data/$SYS_UUID/certs/self/ca/serial" ]; then
	echo 1000 > "/opt/daspanel/data/$SYS_UUID/certs/self/ca/serial"
fi

if [ ! -f "/opt/daspanel/data/$SYS_UUID/certs/self/ca/root.key.pem" -o ! -f "/opt/daspanel/data/$SYS_UUID/certs/self/ca/root.cert.pem" ]; then
    echo "Generating root CA for $SYS_UUID"
    openssl req -newkey rsa:2048 -days 7300 -x509 -nodes \
        -keyout /opt/daspanel/data/$SYS_UUID/certs/self/ca/root.key.pem -out /opt/daspanel/data/$SYS_UUID/certs/self/ca/root.cert.pem \
        -subj "/C=US/ST=Daspanel/L=$SYS_UUID Control Panel/O=$SYS_UUID/CN=$SYS_UUID ROOT CA"
    echo 'Done'
else
    echo "[DASPANEL] Do not need generate new root CA for: $SYS_UUID"
fi

