USERNAME=root
PASSWORD=516489
BACKUPS=$HOME/backups
FILENAME=`date +%H-%M-%d-%m-%Y`
BUCKET=backupmongo
echo "Create mongo backups"
echo  "===================="
docker exec -it mongo mongodump  -u $USERNAME -p $PASSWORD --gzip --out /backups/$FILENAME
echo "Dump mongo done"
echo "===================="
echo "Compress mongo backups to gzip"
echo "============================"
cd $HOME/backups
sudo rm -rf $FILENAME.tar.gz
sudo tar -zcvf $FILENAME.tar.gz $FILENAME
echo "Compress mongo backups done"
echo "============================"
echo "Up load backups file to DigitalOcean"
echo  "===================="
s3cmd put $BACKUPS/$FILENAME.tar.gz s3://$BUCKET
echo "Upload backups file done"
sudo rm -rf $BACKUPS/$FILENAME.tar.gz
