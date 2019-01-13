#!/bin/sh

set -ex

aws s3 sync "s3://$S3_BUCKET/" "./logs/$S3_BUCKET/"

find "./logs/$S3_BUCKET/$S3_LOG_PATH" -type f | xargs gunzip -c | goaccess --log-format CLOUDFRONT --output "./output/$S3_BUCKET.html" -
