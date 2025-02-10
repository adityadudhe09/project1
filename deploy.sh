NEXUS_REPO = "54.163.39.24:8082"
IMAGE_NAME = "simple_web_app"
IMAGE_TAG = "v1.0"
CONTAINER_NAME = "simple_web_app"

echo "Stopping and removing existing container (if running)..."
docker stop $CONTAINER_NAME 2>/dev/null || true
docker rm -f $CONTAINER_NAME 2>/dev/null || true

echo "Pulling the latest image from Nexus..."
docker pull $NEXUS_REPO/$IMAGE_NAME:$IMAGE_TAG

echo "Running new container..."
docker run -d -p 5000:5000 --name $CONTAINER_NAME $NEXUS_REPO/$IMAGE_NAME:$IMAGE_TAG

echo "Cleanup: Removing old unused images..."
docker image prune -f

echo "Deployment completed successfully!"
