def AWS_REGION = 'ap-south-1'
def PROJECT_REPO_URL = 'https://github.com/steelcicd/restapi-service'

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
                sh "./push-image.sh ${AWS_REGION} ${PROJECT_REPO_URL} ${env.JOB_BASE_NAME}"
            }
        }
    }
}