echo "Backups mongo already exits"
s3cmd ls s3://backupmongo/
echo "Enter the name of the file to be downloaded: "
read -p "File name: " file
echo $file
