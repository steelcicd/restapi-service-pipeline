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
        stage('Build') { 
            steps {
                sh 'mvn -B -DskipTests clean package' 
            }
        }
    }
}