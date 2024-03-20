#!/bin/bash

# Define your AWS account ID, AWS region, and image names
AWS_ACCOUNT_ID="992382630898"
AWS_REGION="us-east-1"
IMAGE_NAMES=("admin-portal" "landing-page" "member-dashboard" "aline-gateway" "user-microservice" "underwriter-microservice" "transaction-microservice" "bank-microservice")

# Login to ECR
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com

# Loop through each image and process
for IMAGE_NAME in "${IMAGE_NAMES[@]}"
do
    # Define the ECR repository name
    ECR_REPO_NAME="jh-$IMAGE_NAME"
    
    # Create ECR repository with the specified settings
    aws ecr create-repository \
        --repository-name $ECR_REPO_NAME \
        --image-scanning-configuration scanOnPush=false \
        --image-tag-mutability MUTABLE \
        --encryption-configuration encryptionType=AES256 \
        --region $AWS_REGION || echo "Repository $ECR_REPO_NAME may already exist or another error occurred"
    
    # Tag the Docker image for ECR
    docker tag direstbounty/capstone2:$IMAGE_NAME $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$ECR_REPO_NAME:latest
    
    # Push the image to ECR
    docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$ECR_REPO_NAME:latest
done

echo "All images have been processed."
