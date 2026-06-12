@Library('shared-library') _

pipeline {
    agent { label 'my-agent' }
    stages {
        stage('Run Shared Library') {
            steps {
                buildApp()
            }
        }
    }
    post {
        success {
            echo 'Pipeline Success on my-agent!'
        }
        failure {
            echo 'Pipeline Failed! Check the logs!'
        }
    }
}
