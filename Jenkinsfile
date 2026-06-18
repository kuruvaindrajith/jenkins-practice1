pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out code from GitHub...'
            }
        }
        
        stage('Build') {
            steps {
                echo 'Building the application...'
                sh 'docker build -t myapp:latest .'
            }
        }
        
        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('sonarqube-server') {
                    sh "${tool 'sonar-scanner'}/bin/sonar-scanner \
                        -Dsonar.projectKey=final-project \
                        -Dsonar.sources=."
                }
            }
        }
        
        stage('Test') {
            steps {
                echo 'Running tests...'
                sh 'docker run --rm myapp:latest'
            }
        }
        
        stage('Deploy') {
            steps {
                echo 'Deploying the application...'
                sh 'docker run -d --name final-app-container myapp:latest'
            }
        }
    }
    
    post {
        success {
            echo 'FINAL PROJECT — Pipeline Success!'
            emailext(
                subject: "Final Project SUCCESS: ${env.JOB_NAME}",
                body: "Complete CI/CD Pipeline - Build #${env.BUILD_NUMBER} succeeded! All stages passed - Build, SonarQube, Test, Deploy!",
                to: 'kuruvaindrajith@gmail.com'
            )
        }
        failure {
            echo 'FINAL PROJECT — Pipeline Failed!'
            emailext(
                subject: "Final Project FAILED: ${env.JOB_NAME}",
                body: "Pipeline failed! Check logs immediately.",
                to: 'kuruvaindrajith@gmail.com'
            )
        }
    }
}
