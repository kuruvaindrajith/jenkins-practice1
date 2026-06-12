@Library('shared-library') _

pipeline {
    agent any
    stages {
        stage('Run Shared Library') {
            steps {
                buildApp()
            }
        }
    }
    post {
        success {
            echo 'Pipeline Success using Shared Library!'
        }
        failure {
            echo 'Pipeline Failed! Check the logs!'
        }
    }
}
