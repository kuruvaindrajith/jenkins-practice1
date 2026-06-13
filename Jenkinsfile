pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Building the application...'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing the application...'
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
            emailext(
                subject: "Pipeline SUCCESS: ${env.JOB_NAME}",
                body: "Pipeline ${env.JOB_NAME} - Build #${env.BUILD_NUMBER} succeeded!",
                to: 'kuruvaindrajith@gmail.com'
            )
        }
        failure {
            emailext(
                subject: "Pipeline FAILED: ${env.JOB_NAME}",
                body: "Pipeline ${env.JOB_NAME} - Build #${env.BUILD_NUMBER} failed! Check logs!",
                to: 'kuruvaindrajith@gmail.com'
            )
        }
    }
}
