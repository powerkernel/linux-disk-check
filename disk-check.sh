#!/bin/sh
MAX=90
EMAIL=YOUR_EMAIL@DOMAIN.COM
SERV=HOSTNAME.DOMAIN.COM

# now check part 1
O1=/dev/vda1
USE=`df -h |grep ${O1} | awk '{ print $5 }' | cut -d'%' -f1`
if [ ${USE} -gt ${MAX} ] ; then
  echo "Percent used in $O1: $USE" | mail -s "$SERV is running out of disk space" ${EMAIL}
fi

# now check part 1
#O2=/dev/vdb1
#USE=`df -h |grep ${O2} | awk '{ print $5 }' | cut -d'%' -f1`
#if [ ${USE} -gt ${MAX} ] ; then
#  echo "Percent used in $O2: $USE" | mail -s "$SERV is running out of disk space" ${EMAIL}
#fi
