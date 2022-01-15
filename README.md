# Read me before start
1. Run `setupcron.sh` to setup cron job
2. If you don't have a s3cmd configured, run `s3cmd --configure`
3. Check time with `date` and run `crontab -e` to change time
4. Run `python3 restore.py` to download and extract backup
