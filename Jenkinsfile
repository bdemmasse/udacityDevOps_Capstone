pipeline {
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

                sh './run_docker.sh'

                 sh 'echo "docker build completed"'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                sh 'echo "pushing to docker hub"'
                sh 'echo "$USER_CREDENTIALS_USR $USER_CREDENTIALS_PSW"'

                sh './upload_docker.sh $USER_CREDENTIALS_USR $USER_CREDENTIALS_PSW'
            }
        }
    }
}