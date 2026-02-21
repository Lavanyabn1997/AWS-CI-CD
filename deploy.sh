IMAGE="650781539051.dkr.ecr.us-east-1.amazonaws.com/demo/myapp:latest"

echo "Logging into ECR..."
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 650781539051.dkr.ecr.us-east-1.amazonaws.com

echo "Stopping old container..."
docker stop myapp || true
docker rm myapp || true

echo "Pulling new image..."
docker pull $IMAGE

echo "Running container..."
docker run -d --name myapp -p 80:80 $IMAGE
