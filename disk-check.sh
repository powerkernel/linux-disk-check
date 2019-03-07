#!/bin/sh
MAX=75
NAME=$(hostname -s)
TO=YOUR_EMAIL@DOMAIN.COM
SERV=$(hostname -f)

# now check disk 1
D1=/dev/xvda1
USE=`df -h |grep ${D1} | awk '{ print $5 }' | cut -d'%' -f1`
if [ ${USE} -gt ${MAX} ] ; then
	curl -s --user 'api:YOUR_MAILGUN_API' \
		 https://api.mailgun.net/v3/YOUR_DOMAIN/messages \
		 -F from=''${NAME}' <root@'${SERV}'>' \
		 -F to=''${TO}'' \
		 -F subject="$SERV is running out of disk space" \
		 -F template='disk-space-warning' \
		 -F h:X-Mailgun-Variables='{"hostname": "'${SERV}'", "disk":"'${D1}'", "percent":"'${USE}'"}'
fi