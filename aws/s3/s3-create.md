# S3 Bucket Setup Script

This script automates the process of setting up an S3 bucket in AWS. It performs the following tasks:

1. Checks if the specified S3 bucket already exists.
2. Creates the bucket if it does not exist.
3. Removes Block Public Access settings from the bucket.
4. Attaches a specified bucket policy to allow public read access.
5. Configures CORS settings for the bucket.
6. Enables static website hosting on the bucket.

## Usage

```bash
./s3_setup.sh --bucket-name BUCKET_NAME --region REGION --profile PROFILE