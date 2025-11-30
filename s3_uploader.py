import boto3
import os
import sys
from botocore.exceptions import ClientError

if len(sys.argv) < 2:
    print("Usage: python upload_to_s3.py <file_path>")
    sys.exit(1)

file_path = sys.argv[1]

if not os.path.isfile(file_path):
    print(f"File not found: {file_path}")
    sys.exit(1)

BUCKET_NAME = "ikhlynin-bucket-s3"
s3 = boto3.client("s3")

file_name = os.path.basename(file_path)

try:
    s3.upload_file(file_path, BUCKET_NAME, file_name)
    print(f"Uploaded {file_name} → s3://{BUCKET_NAME}/{file_name}")
except ClientError as e:
    print(f"S3 upload error: {e}")
