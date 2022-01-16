MONGODB_USERNAME=root
MONGODB_PASSWORD=516489
BACKUPS=$HOME/backups
FILENAME=`date +%H-%M-%d-%m-%Y`
BUCKET=backupmongo/backup-mongo/$FILENAME
echo "Create mongo backups"
echo  "===================="
docker exec -it mongo mongodump  -u $MONGODB_USERNAME -p $MONGODB_PASSWORD --gzip --out /backups/$FILENAME
echo "Dump mongo done"
echo "===================="
echo "Compress mongo backups to gzip"
echo "============================"
cd $HOME/backups
sudo rm -rf $FILENAME
sudo tar -zcvf $FILENAME.tar.gz $FILENAME
echo "Compress mongo backups done"
echo "============================"
echo "Up load backups file to DigitalOcean"
echo  "===================="
s3cmd put $BACKUPS/$FILENAME.tar.gz s3://$BUCKET
echo "Upload backups file done"
sudo rm -rf $BACKUPS/$FILENAME.tar.gz
