pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Building the application...'
            }
        }
        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('sonarqube-server') {
                    sh '''
                        docker run --rm \
                        -e SONAR_HOST_URL=http://172.31.80.159:9000 \
                        -e SONAR_TOKEN=$SONAR_AUTH_TOKEN \
                        -v $(pwd):/usr/src \
                        sonarsource/sonar-scanner-cli \
                        -Dsonar.projectKey=jenkins-practice \
                        -Dsonar.sources=.
                    '''
                }
                echo 'SonarQube Analysis Complete — Check dashboard for results!'
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
            echo 'Pipeline Success — SonarQube Analysis Done!'
        }
        failure {
            echo 'Pipeline Failed!'
        }
    }
}
