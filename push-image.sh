REGION=$1
REPO_URI=$2
TAG=$3
PROJECT_DIR=$4

echo 'Building image...'
# build image
docker build -t $REPO_URI:$TAG $PROJECT_DIR

echo 'Pushing image...'
# login to ecr
aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $REPO_URI
# push image
docker push $REPO_URI:$TAG
echo 'Image pushed successfully!'