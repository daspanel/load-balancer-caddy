#!/usr/bin/with-contenv bash
# https://github.com/Fishdrowned/ssl
if [ -z "$1" ]
then
    echo
    echo 'Issue a wildcard SSL certification with Daspanel ROOT CA'
    echo
    echo 'Usage: ./gen.cert.sh <domain> [<domain2>] [<domain3>] [<domain4>] ...'
    echo '    <domain>          The domain name of your site, like "example.dev",'
    echo '                      you will get a certification for *.example.dev'
    echo '                      Multiple domains are acceptable'
    exit;
fi

#echo 'Removing dir out'
#rm -rf /etc/caddy/certs
#echo 'Creating output structure'
#mkdir -p /etc/caddy/certs
#mkdir /etc/caddy/certs/newcerts
#touch /etc/caddy/certs/index.txt
#echo 1000 > /etc/caddy/certs/serial

TMPSAN=""
for var in "$@"
do
    echo "Adding host into SAN certificate: $var"
    TMPSAN="${TMPSAN}DNS:*.${var},DNS:${var},"
    echo "Current SAN host list: $TMPSAN"
done

#SAN=${SAN: : -1}
SAN=""
SAN=${TMPSAN%?}
echo "Generating SAN certificate for: $SAN"

# Create domain directory
DIR="/opt/daspanel/data/$DASPANEL_SYS_UUID/certs/self/$1"
if [ ! -d "$dir" ]; then
    mkdir -p ${DIR}
fi

# Create CSR
openssl req -new -out "${DIR}/$1.csr.pem" \
    -key /opt/daspanel/data/$DASPANEL_SYS_UUID/certs/self/ca/root.key.pem \
    -reqexts SAN \
    -config <(cat /etc/ssl/openssl.cnf \
        <(printf "[SAN]\nsubjectAltName=${SAN}")) \
    -subj "/C=US/ST=Daspanel/L=Control Panel/O=Daspanel/OU=$1/CN=*.$1"

# Issue certification
# openssl ca -batch -config ./ca.cnf -notext -in "${DIR}/$1.csr.pem" -out "${DIR}/$1.cert.pem"
openssl ca -batch \
    -config /opt/daspanel/data/$DASPANEL_SYS_UUID/certs/self/ca/self-ca.cnf \
    -in "${DIR}/$1.csr.pem" \
    -out "${DIR}/$1.cert.pem" \
    -cert /opt/daspanel/data/$DASPANEL_SYS_UUID/certs/self/ca/root.cert.pem \
    -keyfile /opt/daspanel/data/$DASPANEL_SYS_UUID/certs/self/ca/root.key.pem

# Chain certification with CA
cat "${DIR}/$1.cert.pem" /opt/daspanel/data/$DASPANEL_SYS_UUID/certs/self/ca/root.cert.pem > "${DIR}/$1.bundle.cert.pem"

# Output certifications
echo
echo "Certifications are located in:"
find "${DIR}/" -type f

