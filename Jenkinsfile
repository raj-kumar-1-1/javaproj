pipeline {
    agent any

    environment {
        DOCKER_USERNAME = ''
        DOCKER_PASSWORD = ''
    }

    stages {
        stage('Checkout') {
            steps {
                echo "Checking out the code from GitHub"
                // Checkout the code from your Git repository
                git 'https://github.com/raj-kumar-1-1/javaproj.git'
            }
        }

        stage('Build') {
            steps {
                echo "Building the project"
                // Add your build steps here (e.g., Maven, Gradle, etc.)
                // For example, a simple Maven build could look like:
                // sh 'mvn clean install'
            }
        }

        stage('Login to Docker Hub') {
            steps {
                script {
                    echo "Logging in to Docker Hub"
                    withCredentials([usernamePassword(credentialsId: 'rajkumar121', 
                                                       usernameVariable: 'DOCKER_USERNAME', 
                                                       passwordVariable: 'DOCKER_PASSWORD')]) {
                        // Set the environment variables using the credentials
                        echo "Logging into Docker Hub with credentials"
                        sh """
                        echo \$DOCKER_PASSWORD | docker login -u \$DOCKER_USERNAME --password-stdin
                        """
                    }
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image"
                script {
                    // Build the Docker image
                    sh 'docker build -t myapp .'
                }
            }
        }

        stage('Push Docker Image to Docker Hub') {
            steps {
                echo "Pushing Docker image to Docker Hub"
                script {
                    // Push the Docker image to Docker Hub
                    sh 'docker push myapp'
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
        always {
            echo 'Cleaning up!'
            // Any cleanup steps you may want to run
        }
    }
}
