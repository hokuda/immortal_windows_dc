#!/bin/sh

cat $1 | \
    sed -e 's/^password: .*/password: "xxxxxxxx"/' | \
    sed -e 's/^  zone: .*/  zone: "domain name of the route53 zone"/' | \
    sed -e 's/^  record: .*/  record: "fqdn of the host in the route53 zone"/' | \
    tee settings.xml.template.`date +%s`
