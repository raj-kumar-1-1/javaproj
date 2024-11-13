pipeline {
    agent any

    environment {
        // Do not directly use credentials in environment block
        // DOCKER_USERNAME = credentials('rajkumar121').username
        // DOCKER_PASSWORD = credentials('rajkumar121').password
    }

    stages {
        stage('Build') {
            steps {
                script {
                    // Use 'withCredentials' to inject the credentials into the pipeline
                    withCredentials([usernamePassword(credentialsId: 'rajkumar121', 
                                                       usernameVariable: 'DOCKER_USERNAME', 
                                                       passwordVariable: 'DOCKER_PASSWORD')]) {
                        // Now you can use DOCKER_USERNAME and DOCKER_PASSWORD
                        echo "Docker username: ${env.DOCKER_USERNAME}"
                        echo "Docker password: ${env.DOCKER_PASSWORD}"

                        // For example, logging into Docker
                        sh """
                        echo ${DOCKER_PASSWORD} | docker login -u ${DOCKER_USERNAME}
                        """
                    }
                }
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
