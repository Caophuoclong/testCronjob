sudo apt update && sudo apt-get update
sudo apt install tar s3cmd
cp ./backups.sh ~/backups.sh
cp ./crontab ~/crontab
sudo touch /var/log/backup.mongo.log
sudo chown 999:999 /var/log/backup.mongo.log
crontab ~/crontab
