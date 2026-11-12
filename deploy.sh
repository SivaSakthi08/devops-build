#!/bin/bash

set -euo pipefail

if [ "$#" -ne 3 ]; then
    echo "Usage: ./deploy.sh <EC2_PUBLIC_IP> <SSH_KEY_PATH> <DOCKER_IMAGE>"
    exit 1
fi

EC2_HOST="$1"
SSH_KEY="$2"
DOCKER_IMAGE="$3"

echo "Deploying application to EC2..."

ssh -i "$SSH_KEY" "ec2-user@$EC2_HOST" "
    sudo docker pull '$DOCKER_IMAGE'
    sudo docker rm -f devops-app || true
    sudo docker run -d \
        --name devops-app \
        --restart unless-stopped \
        -p 80:80 \
        '$DOCKER_IMAGE'
"

echo "Deployment completed successfully!"
