#!/bin/bash

# Function to display usage
usage() {
  echo "Usage: $0 --bucket-name BUCKET_NAME --region REGION --profile PROFILE"
  exit 1
}

# Parse command-line arguments
while [[ "$#" -gt 0 ]]; do
  case $1 in
    --bucket-name) BUCKET_NAME="$2"; shift ;;
    --region) REGION="$2"; shift ;;
    --profile) PROFILE="$2"; shift ;;
    *) usage ;;
  esac
  shift
done

# Validate required arguments
if [ -z "$BUCKET_NAME" ] || [ -z "$REGION" ] || [ -z "$PROFILE" ]; then
  usage
fi

# Check if the bucket already exists
if aws s3api head-bucket --bucket "$BUCKET_NAME" --profile $PROFILE 2>/dev/null; then
  echo "Bucket already exists."
else
  # If the bucket does not exist, create it
  echo "Bucket does not exist. Creating bucket..."
  aws s3api create-bucket --bucket $BUCKET_NAME --region $REGION --create-bucket-configuration LocationConstraint=$REGION --profile $PROFILE
  echo "Bucket created successfully."
fi

# Remove Block Public Access settings
echo "Removing Block Public Access settings..."
aws s3api delete-public-access-block --bucket $BUCKET_NAME --profile $PROFILE

# Attach the specified bucket policy
POLICY='{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": [
                "arn:aws:s3:::'$BUCKET_NAME'",
                "arn:aws:s3:::'$BUCKET_NAME'/*"
            ]
        }
    ]
}'
aws s3api put-bucket-policy --bucket $BUCKET_NAME --policy "$POLICY" --profile $PROFILE

# Configure CORS for the bucket
CORS='{
    "CORSRules": [
        {
            "AllowedHeaders": [
                "*"
            ],
            "AllowedMethods": [
                "PUT",
                "POST",
                "GET"
            ],
            "AllowedOrigins": [
                "*"
            ],
            "ExposeHeaders": [],
            "MaxAgeSeconds": 0
        }
    ]
}'
aws s3api put-bucket-cors --bucket $BUCKET_NAME --cors-configuration "$CORS" --profile $PROFILE

# Enable static website hosting
aws s3 website s3://$BUCKET_NAME/ --index-document index.html --error-document error.html --profile $PROFILE

echo "All configurations applied successfully."
