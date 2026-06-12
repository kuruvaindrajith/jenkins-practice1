pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Building Docker Image...'
                sh 'docker build -t myapp:latest .'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing the application...'
                sh 'docker run --rm myapp:latest'
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                echo 'Deploying to Kubernetes...'
                sh 'kubectl apply -f deployment.yaml'
            }
        }
    }
    post {
        success {
            echo 'Pipeline Success! App deployed to Kubernetes!'
        }
        failure {
            echo 'Pipeline Failed! Check the logs!'
        }
    }
}
