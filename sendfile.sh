#!/bin/sh

if [ "x$2" = "x" ]; then
   echo "Usage: $0 <jsonfile> <file you want to send>"
fi

JSON=$1
export FILE=$2
PASSWORD=`jq -r .password $JSON`

HOSTNAME=hokuda-kdc.apac.aws.cee.support
INVENTRY=${HOSTNAME}.inventry

echo "[windows]"			>  $INVENTRY
echo "$HOSTNAME"			>> $INVENTRY
echo ""					>> $INVENTRY
echo "[windows:vars]"			>> $INVENTRY
echo "ansible_user=Administrator"	>> $INVENTRY
echo "ansible_password=$PASSWORD" 	>> $INVENTRY
echo "ansible_port=5986"		>> $INVENTRY
echo "ansible_connection=winrm"		>> $INVENTRY
echo "ansible_winrm_server_cert_validation=ignore" >> $INVENTRY

ansible-playbook -vvvv -i $INVENTRY sendfile.yaml
