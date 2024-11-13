pipeline {
    agent any

    environment {
        // Define Docker image details
        DOCKER_IMAGE = 'rajkumar121/my-java-project'
    }

    stages {
        stage('Build') {
            steps {
                script {
                    // Build Docker image locally
                    bat 'docker build -t my-java-project:latest .'
                    
                    // Tag Docker image for Docker Hub
                    // bat "docker tag w9-csedd:latest ${DOCKER_IMAGE}:latest"
                    
                    // Push Docker image to Docker Hub
                    bat "docker push rajkumar121/my-java-project:latest"
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    // Placeholder for any tests you want to run (optional)
                    echo 'Running tests...'
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Start Minikube if not already started
                    bat 'minikube start'

                    // Apply Kubernetes Deployment configuration
                    bat 'kubectl apply -f deployment.yaml'
                    
                    // Apply Kubernetes Service configuration
                    bat 'kubectl apply -f service.yaml'

                    // Open Minikube dashboard
                    bat 'minikube dashboard'

                    // Check the status of services
                    bat 'kubectl get services'
                    
                    echo 'Deploying application...'
                }
            }
        }
    }
}
