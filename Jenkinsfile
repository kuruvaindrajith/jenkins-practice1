pipeline {
    agent any
    
    parameters {
        string(name: 'ENVIRONMENT', defaultValue: 'dev', description: 'Deploy to which environment?')
        choice(name: 'BUILD_TYPE', choices: ['build', 'test', 'deploy'], description: 'What to run?')
    }
    
    environment {
        APP_NAME = 'myapp'
        VERSION = '1.0.0'
    }
    
    stages {
        stage('Build') {
            when {
                expression { params.BUILD_TYPE == 'build' || params.BUILD_TYPE == 'deploy' }
            }
            steps {
                echo "Building ${env.APP_NAME} version ${env.VERSION}"
                echo "Environment: ${params.ENVIRONMENT}"
            }
        }
        stage('Test') {
            when {
                expression { params.BUILD_TYPE == 'test' || params.BUILD_TYPE == 'deploy' }
            }
            steps {
                echo "Testing ${env.APP_NAME}..."
            }
        }
        stage('Parallel Stage') {
            parallel {
                stage('Unit Test') {
                    steps {
                        echo 'Running Unit Tests...'
                    }
                }
                stage('Integration Test') {
                    steps {
                        echo 'Running Integration Tests...'
                    }
                }
            }
        }
        stage('Deploy') {
            when {
                expression { params.BUILD_TYPE == 'deploy' }
            }
            steps {
                echo "Deploying ${env.APP_NAME} to ${params.ENVIRONMENT}..."
            }
        }
    }
    post {
        success {
            echo 'Pipeline Success!'
        }
    }
}
