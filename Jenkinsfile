pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "hms-frontend-angular"
        CONTAINER_NAME = "hms-ang-container"
        APP_PORT = "4200"
        NETWORK_NAME = "hms-network"
    }

    stages {
        stage('Clone Repo') {
            steps {
                checkout scmGit(
                    branches: [[name: '*/main']], 
                    extensions: [], 
                    userRemoteConfigs: [[
                        credentialsId: 'Git_Creds', 
                        url: 'https://github.com/bharathi2807/HMS-Frontend.git'
                    ]]
                )
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Build Angular App') {
            steps {
                sh 'npm run build --prod'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${DOCKER_IMAGE} ."
            }
        }

        stage('Run Docker Container') {
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
