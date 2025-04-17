def AWS_REGION = 'ap-south-1'
def PROJECT_REPO_URL = 'https://github.com/steelcicd/restapi-service'
def MAVEN_VERSION = 0.0.0

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
        try{
            stage('Build project') { 
                steps {
                    echo 'Building maven project...'
                    sh 'mvn -B -DskipTests clean package'
                    echo 'Maven build successful!' 
                }
            }
        }finally{
            import hudson.model.*;
            import hudson.util.*;

            def thr = Thread.currentThread();
            def currentBuild = thr?.executable;
            MAVEN_VERSION = currentBuild.getParent().getModules().toArray()[0].getVersion();
            echo "MAVEN VERSION: ${MAVEN_VERSION"
        }
        stage('Build and push Docker Image') {
            steps {
                sh "./push-image.sh ${AWS_REGION} ${PROJECT_REPO_URL} "
            }
        }
    }
}