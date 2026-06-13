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
            }
        }
        stage('Quality Gate') {
            steps {
                waitForQualityGate abortPipeline: true
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
            echo 'Pipeline Success — Quality Gate Passed!'
        }
        failure {
            echo 'Pipeline Failed — Quality Gate Failed!'
        }
    }
}
