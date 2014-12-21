Docker awscli
=============

Run a container with awcli and s3cmd installed. For example, you can
run this on CoreOS where awcli and s3cmd are not available. One
use case is to fire up the container to get data from s3 bucket to 
/apps directory and the data can be shared out on the docker host for
other containers to use.

# ENV

A credentials file will be set at /root/.aws/credentials if you pass docker 
 -e "AWS_ACCESS_KEY=your_key"
 -e "AWS_SECRET_KEY=your_secret"
And set default region
 -e "AWS_REGION=us-west-2"

# VOLUME

Volumes are set at /apps and /data

# USE
 - Grab some data for the local host (with IAM profile setup) 
<code>
    /usr/bin/docker run  --rm -v /var/apps:/apps guruvan/awscli:latest aws s3 cp --recursive s3://<bucket>/apps/nginx/ /apps/nginx
</code>
 - Run an interactive shell so you can use clitools directly:
<code>
   /usr/bin/docker run -it --rm \
     -e "AWS_ACCESS_KEY=your_key" \
     -e "AWS_SECRET_KEY=your_secret"
     -e "AWS_REGION=us-west-2" \
     -v /opt/data:/data \
    guruvan/awscli /bin/bash
</code>

  - Get some S3 data to use as a data container:
<code>
  /usr/bin/docker run  \
     --name data_container \
     -e "AWS_ACCESS_KEY=your_key" \
     -e "AWS_SECRET_KEY=your_secret"
     -e "AWS_REGION=us-west-2" \
     -v /opt/data:/data \
    guruvan/awscli aws s3 cp --recursive s3://<bucket>/apps/nginx/ /apps/nginx 
</code>
 
