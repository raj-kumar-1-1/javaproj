pipeline {
    agent any
    environment {
        DOCKER_USERNAME = credentials('rajkumar121').username
        DOCKER_PASSWORD = credentials('rajkumar121').password
    }
    stages {
        stage('Checkout SCM') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                script {
                    // Building the Docker image
                    bat 'docker build -t my-java-project:latest .'
                    bat 'docker tag my-java-project:latest rajkumar121/my-java-project:latest'
                }
            }
        }
        stage('Push to Docker Hub') {
            steps {
                script {
                    // Use withCredentials for logging into Docker Hub
                    withCredentials([usernamePassword(credentialsId: 'rajkumar121', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        bat "echo ${DOCKER_PASSWORD} | docker login -u ${DOCKER_USERNAME} "
                    }
                    bat 'docker push rajkumar121/my-java-project:latest'
                }
            }
        }
    }
}
