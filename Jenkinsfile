def AWS_REGION = 'ap-south-1'
def PROJECT_REPO_URL ='https://github.com/steelcicd/restapi-service'
def ECR_REGISTRY_URL ='654654236916.dkr.ecr.ap-south-1.amazonaws.com/cloud-services/restapi-service'

pipeline {
    agent { label 'slave-1' }
    stages {
        stage('Checkout project') {
            steps {
                git branch: 'main',
                credentialsId: 'github_creds',
                url: PROJECT_REPO_URL
            }
        }
        stage('Build project') { 
            steps {
                echo 'Building maven project...'
                sh 'mvn -B -DskipTests clean package'
                echo 'Maven build successful!' 
            }
        }
        stage('Build and push Docker Image') {
            steps {
                sh "chmod +x ${env.WORKSPACE}/push-image.sh"
                sh "${env.WORKSPACE}/push-image.sh ${AWS_REGION} ${ECR_REGISTRY_URL}"
            }
        }
    }
}