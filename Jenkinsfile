pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Building the application...'
            }
        }
        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('sonarqube-server') {
                    sh "${tool 'sonar-scanner'}/bin/sonar-scanner \
                        -Dsonar.projectKey=jenkins-practice \
                        -Dsonar.sources=."
                }
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying the application...'
            }
        }
    }
    post {
        success {
            echo 'Pipeline Success!'
        }
        failure {
            echo 'Pipeline Failed!'
        }
    }
}
