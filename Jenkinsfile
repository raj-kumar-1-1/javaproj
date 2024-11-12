pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials-id') // Replace with your Docker Hub credentials ID
        GITHUB_CREDENTIALS = credentials('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') // Replace with your GitHub credentials ID
        DOCKER_IMAGE = 'rajkumar121/my-java-project:latest' // Update this with your Docker Hub image name
    }
    
    stages {
        stage('Clone Repository') {
            steps {
                git credentialsId: 'github-credentials-id', url: 'https://github.com/raj-kumar-1-1/javaproj' // Replace with your GitHub repo URL
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image with the specified tag
                    bat 'docker build -t my-java-project .'
                }
            }
        }
        
        stage('Tag and Push to Docker Hub') {
            steps {
                script {
                    // Tag the image and push to Docker Hub
                    bat 'docker tag my-java-project:latest ${DOCKER_IMAGE}'
                    
                    docker.withRegistry('https://index.docker.io/v1/', DOCKERHUB_CREDENTIALS) {
                        bat "docker push ${DOCKER_IMAGE}"
                    }
                }
            }
        }
        
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    // Deploy the application to Kubernetes
                    bat 'kubectl apply -f k8s/deployment.yaml' // Ensure your Kubernetes YAML file path is correct
                    bat 'kubectl apply -f k8s/service.yaml' // Ensure your Kubernetes YAML file path is correct
                    
                    // Optional: Verify deployment
                    bat 'kubectl get pods'
                    bat 'kubectl get services'
                }
            }
        }
        
        stage('Test') {
            steps {
                script {
                    echo 'Running tests...'
                    // Add any specific testing commands here
                }
            }
        }
    }
}
