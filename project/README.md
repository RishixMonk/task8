As i was using postgres database,To run cron jobs inside a postgres database,tried to update postgres version and install cron in a seperate dockerfile.

create a crontab with command of storing postrgres data in backup file every day of every month at 11:55 pm. 

copy crontab in /etc/cron.d/crontab and run the cron job.

Then in dockercompose build database image with this dockerfile.
