
import os
def inputIndexOfFile():
    index = input("Choose your backup file: ")
    if(index.isnumeric()):
            index = int(index)
            return index
    else:
        print("Invalid input. Please choose a number")
        return inputIndexOfFile()
print("Backups mongo already exits...")
response = os.popen("s3cmd ls s3://backupmongo").read()
arrayMongoBackup = response.split("\n")
arrayMongoBackup.pop()
files = []
for backup in arrayMongoBackup:
    backup = backup.split(" ")[-1].split("/")[-1].split(".")[0]
    files.append(backup)

for i in range(len(files)):
    print(str(i+1) + ": " + files[i])
false = False
index = inputIndexOfFile()
while false == False:
    if(index < 0 or index > len(files)):
        print("Please choose a valid number")
        index = inputIndexOfFile()
    else:
        false = True
index = index - 1    
url = "s3://backupmongo/" + files[index] + ".tar.gz"
print("Where do you want to place your backup?")
place = input("Default place is /tmp/\n")
if(place == ""):
    place = "/tmp"
if (place == "."):
    place = os.getcwd()
print("Downloading backup file: " + url)
cmd = "s3cmd get --force " + url + " " + place 
os.popen(cmd).read()
print("Unzipping backup file: " + files[index])
os.popen("tar -xzf " + place + "/" + files[index] + ".tar.gz -C " + place).read()
print("You need to redirect to the placed backup file!")
print("It placed in: " + place + "/" + files[index])
print("Restoring mongo...")