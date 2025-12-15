pipeline {
    agent none

    environment {
        DOCKER_IMAGE = "hms-frontend-angular"
        CONTAINER_NAME = "hms-ang-container"
        APP_PORT = "8085"
        NETWORK_NAME = "hms-network"
    }

    stages {

        stage('Build Angular') {
            agent {
                docker {
                    image 'node:20-alpine'
                    args '-u root'
                }
            }
            steps {
                checkout scm
                sh 'node -v'
                sh 'npm -v'
                sh 'npm install'
                sh 'npm run build -- --inline-fonts=false'
                sh 'ls -l dist'
            }
        }

        stage('Build Docker Image') {
            agent any
            steps {
                sh "docker build -t ${DOCKER_IMAGE} ."
            }
        }

        stage('Run Docker Container') {
            agent any
            steps {
                sh """
                docker stop ${CONTAINER_NAME} || true
                docker rm -f ${CONTAINER_NAME} || true
                docker run -d --name ${CONTAINER_NAME} --network ${NETWORK_NAME} -p ${APP_PORT}:80 ${DOCKER_IMAGE}
                """
            }
        }
    }
}