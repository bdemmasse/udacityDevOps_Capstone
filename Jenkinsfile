pipeline {
    agent any
    stages {
        stage('Lint Html') {
            steps {
                sh 'tidy -q -e *.html'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh './run_docker.sh'
            }
        }
    }
}