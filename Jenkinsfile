pipeline {
    agent any
    stages {
        stage('Use Credentials') {
            steps {
                withCredentials([string(credentialsId: 'my-secret-password', variable: 'MY_PASSWORD')]) {
                    sh 'echo "Password is: $MY_PASSWORD"'
                    sh 'echo "Password hidden in logs!"'
                }
            }
        }
    }
    post {
        success {
            echo 'Credentials Pipeline Success!'
        }
    }
}
