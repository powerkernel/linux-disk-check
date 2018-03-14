# linux-disk-check
A script that checks if your Linux server is running out of disk space

## Usage
Edit `MAX`, `EMAIL`, `SERV`, `O1`, `O2`... in *disk-check.sh* and upload to your Linux server, then config crontab to run the script daily.

If you need to check more partitions, just add more block code in the script like this:

```sh
O3=/dev/vdc1
USE=`df -h |grep ${O3} | awk '{ print $5 }' | cut -d'%' -f1`
if [ ${USE} -gt ${MAX} ] ; then
  echo "Percent used in $O3: $USE" | mail -s "$SERV is running out of disk space" ${EMAIL}
fi
```
