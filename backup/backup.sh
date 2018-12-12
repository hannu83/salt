#This is the backupfile.
#!/bin/sh
THESITE="html"
THEDB="books" 
THEDBUSER="books" 
THEDBPW="password" 
THEDATE=`date +%d%m%y%H%M`

mysqldump -u $THEDBUSER -p${THEDBPW} $THEDB | gzip > /home/xubuntu/Public/dbbackup_${THEDB}_${THEDATE}.bak.gz

tar cvf /home/xubuntu/Public/sitebackup_${THESITE}_${THEDATE}.tar -C / var/www
gzip /home/xubuntu/Public/sitebackup_${THESITE}_${THEDATE}.tar

find /home/xubuntu/Public/site* -mtime +5 -exec rm {} \;
find /home/xubuntu/Public/db* -mtime +5 -exec rm {} \;
