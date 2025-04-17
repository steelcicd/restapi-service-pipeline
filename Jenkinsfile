pipeline {
    agent { label 'slave-1' }
    stages {
        stage('Checkout project') {
            steps {
                git branch: 'main',
                credentialsId: 'github_creds',
                url: 'https://github.com/steelcicd/restapi-service'
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
                sh './push-image.sh'
            }
        }
    }
}