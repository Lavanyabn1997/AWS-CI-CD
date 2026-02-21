IMAGE="650781539051.dkr.ecr.us-east-2.amazonaws.com/my-web-app:latest"

echo "Logging into ECR..."
aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 650781539051.dkr.ecr.us-east-2.amazonaws.com

echo "Stopping old container..."
docker stop my-web-app || true
docker rm my-web-app || true

echo "Pulling new image..."
docker pull $IMAGE

echo "Running container..."
docker run -d --name my-web-app -p 80:80 $IMAGE
