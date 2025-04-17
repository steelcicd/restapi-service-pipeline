REGION=$1
REGISTRY_URI=$2
PROJECT_DIR=$3

echo 'Building image...'
# build image
docker build -t $REGISTRY_URI:latest $PROJECT_DIR

echo 'Pushing image...'
# login to ecr
aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $REGISTRY_URI
# push image
docker push $REGISTRY_URI:latest
echo 'Image pushed successfully!'