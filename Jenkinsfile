pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Building the application...'
                sh 'docker build -t myapp:latest .'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing the application...'
                sh 'docker run --rm myapp:latest'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying the application...'
                sh 'docker run -d --name myapp-container myapp:latest'
            }
        }
    }
    post {
        success {
            echo 'Pipeline Success! Docker container deployed!'
        }
        failure {
            echo 'Pipeline Failed! Check the logs!'
        }
    }
}
