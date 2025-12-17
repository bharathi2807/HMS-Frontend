pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "hms-frontend-angular"
        CONTAINER_NAME = "hms-ang-container"
        APP_PORT = "8085"
        NETWORK_NAME = "hms-network"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build --no-cache -t ${DOCKER_IMAGE} ."
            }
        }

        stage('Deploy Container') {
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
