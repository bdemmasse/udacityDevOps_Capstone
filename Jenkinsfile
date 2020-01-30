pipeline {
    environment {
        USER_CREDENTIALS = credentials('dockerhub')
    }
    agent any
    stages {
        stage('Lint Html') {
            steps {
                sh 'echo "linting started"'
                sh 'tidy -q -e *.html'
                sh 'echo "linting completed"'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'echo "docker build started"'
                sh 'chmod 777 ./run_docker.sh'
                sh './run_docker.sh'
                sh 'echo "docker build completed"'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                sh 'echo "pushing to docker hub"'
                sh 'chmod 777 ./upload_docker.sh'
                sh './upload_docker.sh $USER_CREDENTIALS_USR $USER_CREDENTIALS_PSW'
                sh 'echo "pushing to docker hub completed"'
            }
        }
    }
}