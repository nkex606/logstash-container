#!/bin/bash
set -e

# set custom elasticsearch endpoint
if [ ! -z "$ES_HOST" ]; then
    sed -i "s/hosts => \[\"your-es-host\"\]/hosts => \[\"$ES_HOST\"\]/g" /etc/logstash/logstash.conf
fi

# set custom s3 bucket
if [ ! -z "$S3_BUCKET" ]; then
  sed -i "s/bucket => \"bucketname\"/bucket => \"$S3_BUCKET\"/g" /etc/logstash/logstash.conf
fi

# replace access key
if [ ! -z "$AWS_ACCESS_KEY" ]; then
  sed -i "s/access_key_id => \"your-access-key\"/access_key_id => \"$AWS_ACCESS_KEY\"/g" /etc/logstash/logstash.conf
fi

# replace secret key
if [ ! -z "$AWS_SECRET_KEY" ]; then
  sed -i "s/secret_access_key => \"your-secret-key\"/secret_access_key => \"$AWS_SECRET_KEY\"/g" /etc/logstash/logstash.conf
fi

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
    set -- logstash "$@"
fi

# Run as user "logstash" if the command is "logstash"
# allow the container to be started with `--user`
if [ "$1" = 'logstash' -a "$(id -u)" = '0' ]; then
    set -- gosu logstash "$@"
fi

exec "$@"
