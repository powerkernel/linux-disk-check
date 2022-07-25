#!/bin/sh
MAX=75
SERV=YOUR_SERVER_NAME
SLACK=YOUR_SLACK_WEBHOOK_URL

# now check disk 1
D1=/dev/sda1
USE=`df -h |grep ${D1} | awk '{ print $5 }' | cut -d'%' -f1`
if [ ${USE} -gt ${MAX} ] ; then
        curl -X POST -H 'Content-type: application/json' --data '{"text":"Disk `'${D1}'` on `'${SERV}'` is running out of space (used '${USE}'%)"}' $SLACK
fi
