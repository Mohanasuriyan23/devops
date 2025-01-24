pipeline {
    agent any
    environment {
        DOCKER_DEV_REPO = 'mohanasuriyan/dev'
        DOCKER_PROD_REPO = 'mohanasuriyan/prod'
        DOCKER_CREDENTIALS = 'b790b43d-6622-48ba-a244-01524189ecd7'
    }
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'dev', url: 'https://github.com/Mohanasuriyan23/devops.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_DEV_REPO}:latest")
                }
            }
        }
        stage('Push to Docker Hub - Dev') {
            when {
                branch 'dev' // Push only for the 'dev' branch
            }
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: "${DOCKER_CREDENTIALS}", usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                        sh 'docker login -u $DOCKER_USER -p $DOCKER_PASS'
                        sh "docker push ${DOCKER_DEV_REPO}:latest"
                    }
                }
            }
        }
        stage('Push to Docker Hub - Prod') {
            when {
                branch 'main' // Push only for the 'main' branch
            }
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: "${DOCKER_CREDENTIALS}", usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                        sh 'docker login -u $DOCKER_USER -p $DOCKER_PASS'
                        sh "docker tag ${DOCKER_DEV_REPO}:latest ${DOCKER_PROD_REPO}:latest" // Retag the dev image as prod
                        sh "docker push ${DOCKER_PROD_REPO}:latest"
                    }
                }
            }
        }
        stage('Deploy Application') {
            steps {
                sh 'chmod +x ./deploy.sh'
                sh './deploy.sh'
            }
        }
    }
    triggers {
        pollSCM('* * * * *') // Optional: Replace with webhook for better triggering
    }
}


