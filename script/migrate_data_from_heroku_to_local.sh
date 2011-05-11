#!/bin/bash -ex
# This script asks Heroku to backup the current production data, then downloads that dump and imports it into the local db.
# It is at least 3 times quicker than heroku db:pull, and we can only do it because we are dumping from postgres to postgres.
heroku pgbackups:capture --expire
curl -o tmp/latest.dump `heroku pgbackups:url`
pg_restore --verbose --clean --no-acl --no-owner -d chrisaitchisondotcom_dev tmp/latest.dump 