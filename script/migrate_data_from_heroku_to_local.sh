heroku pgbackups:capture --expire
curl -o tmp/latest.dump `heroku pgbackups:url`
pg_restore --verbose --clean --no-acl --no-owner -d chrisaitchisondotcom_dev tmp/latest.dump 