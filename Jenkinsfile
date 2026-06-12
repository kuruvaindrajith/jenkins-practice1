pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Build stage started...'
                sh 'mkdir -p myapp && echo "App code here" > myapp/app.txt'
                echo 'Build stage completed!'
            }
        }
        stage('Test') {
            steps {
                echo 'Test stage started...'
                sh 'cat myapp/app.txt'
                echo 'All tests passed!'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploy stage started...'
                sh 'cp myapp/app.txt /tmp/deployed-app.txt'
                echo 'Application deployed successfully!'
            }
        }
    }
    post {
        success {
            echo 'PIPELINE SUCCESS! Application deployed!'
        }
        failure {
            echo 'PIPELINE FAILED! Check the logs!'
        }
    }
}
