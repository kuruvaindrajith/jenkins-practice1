pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Building the application...'
            }
        }
        stage('Approval') {
            steps {
                input message: 'Deploy to production?', ok: 'Yes, Deploy!'
            }
        }
        stage('Deploy') {
            options {
                timeout(time: 5, unit: 'MINUTES')
                retry(3)
            }
            steps {
                echo 'Deploying the application...'
                sh 'sleep 2'
                echo 'Deploy successful!'
            }
        }
    }
    post {
        success {
            echo 'Pipeline Success!'
        }
        failure {
            echo 'Pipeline Failed or Timed out!'
        }
    }
}
