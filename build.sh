#!/bin/bash

set -e

IMAGE_NAME="devops-build"
IMAGE_TAG="dev"

echo "Building Docker image..."

docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .

echo "Docker image built successfully!"
