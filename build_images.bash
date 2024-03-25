#!/bin/bash

# Define the parent directory where all microservices directories are located.
PARENT_DIR="C:\Users\jewni\AlineFinancial"

# Define a base name for your images.
IMAGE_BASE_NAME="direstbounty/capstone2"

# Define the microservices and their respective directories.
declare -A microservices=( 
    #["account-microservice"]="account-microservice"
    #["landing-page"]="landing-page"
    #["admin-portal"]="admin-portal"
    #["member-dashboard"]="member-dashboard"
    ["aline-gateway"]="aline-gateway"
    #["user-microservice"]="user-microservice"
    #["underwriter-microservice"]="underwriter-microservice"
    #["transaction-microservice"]="transaction-microservice"
    #["bank-microservice"]="bank-microservice"
    

)

# Loop through the microservices array and build each Docker image.
for service in "${!microservices[@]}"; do
    SERVICE_DIR="${microservices[$service]}"
    echo "Building Docker image for $service..."

    # Navigate to the service directory.
    cd "$PARENT_DIR/$SERVICE_DIR"

    # Build the Docker image.
    docker build -t "$IMAGE_BASE_NAME:$service" .

    echo "Docker image for $service built successfully."
    echo "---------------------------------------------"
done

echo "All microservices Docker images have been rebuilt locally."
