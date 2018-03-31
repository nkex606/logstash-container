# logstash-container

A logstash container to receive logs from filebeat and forward to S3 bucket and elasticsearch host.
Base on logstash:latest image.

## Usage
1. Build docker image
```
docker image build -t <image>:<tag> .
```

2. Run the container
```
docker container run --rm \
-e S3_BUCKET="<your-bucket>" \
-e ES_HOST="<your-es-host>" \
-e AWS_ACCESS_KEY="<your-access-key>" \
-e AWS_SECRET_KEY="<your secret key>" \
<image>:<tag>
```

3. logstash.conf

You are free to change the configuration file with yours, and just run the container by
```
docker container run --rm <image>:<tag>
```
