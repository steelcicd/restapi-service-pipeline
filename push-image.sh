REGION=$1
REPO_URI=$2
TAG=$3
PROJECT_DIR=$4

# login to ecr
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin $REPO_URI

# build image
docker build -t $REPO_URI:$TAG $PROJECT_DIR

# push image
docker push $REPO_URI:$TAG