Create an S3 Bucket:

aws s3api create-bucket --bucket omarshaban-4tr426tr4rt7248ry87 --region us-east-1
 
delete-public-access-block:

aws s3api delete-public-access-block --bucket omarshaban-4tr426tr4rt7248ry87

Configure Bucket Permissions:

vim bucket-policy.json



in bucket-policy.json:

{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::my-bucket-name/*"
        }
    ]
}


Apply the bucket policy:

aws s3api put-bucket-policy --bucket omarshaban-4tr426tr4rt7248ry87 --policy file://bucket-policy.json

Upload a File to the Bucket:


aws s3 cp omarshaban.txt s3://omarshaban-4tr426tr4rt7248ry87/omarshaban.txt


Download a File from the Bucket:

aws s3 cp s3://omarshaban-4tr426tr4rt7248ry87/omarshaban.txt omarshaban-downloaded.txt


Enable Versioning on the Bucket:


aws s3api put-bucket-versioning --bucket omarshaban-4tr426tr4rt7248ry87 --versioning-configuration Status=Enabled


Enable Server Access Logging:
 create a logging bucket:

aws s3api create-bucket --bucket omarshaban-logging-fh4wf4389f3j9 --region us-east-1

delete-public-access-block:

aws s3api delete-public-access-block --bucket  omarshaban-logging-fh4wf4389f3j9

configure the logging settings for your primary bucket:

aws s3api put-bucket-logging --bucket omarshaban-logging-fh4wf4389f3j9 --bucket-logging-status '{
    "LoggingEnabled": {
        "TargetBucket": "omarshaban-logging-fh4wf4389f3j9",
        "TargetPrefix": "my-bucket-logs/"
    }
}'

