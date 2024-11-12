pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('rajkumar121:Rajkumar2005') // Docker Hub credentials ID
        DOCKER_IMAGE = 'rajkumar121/my-java-project:latest' // Docker image name to push
        KUBECONFIG_CREDENTIALS = credentials('kubeconfig-credentials-id') // Kubernetes config credentials ID
    }
    
    stages {
        stage('Clone Repository') {
            steps {
                git credentialsId: 'github-credentials-id', url: 'https://github.com/raj-kumar-1-1/javaproj' // Replace with your GitHub repository URL and credentials ID
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    docker.build(DOCKER_IMAGE)
                }
            }
        }
        
        stage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    // Push Docker image to Docker Hub
                    docker.withRegistry('https://index.docker.io/v1/', DOCKERHUB_CREDENTIALS) {
                        docker.image(DOCKER_IMAGE).push('latest')
                    }
                }
            }
        }
        
        stage('Deploy to Kubernetes') {
            steps {
                withKubeConfig([credentialsId: KUBECONFIG_CREDENTIALS]) {
                    // Apply the Kubernetes configuration files (deployment and service)
                    sh 'kubectl apply -f k8s/deployment.yaml'
                    sh 'kubectl apply -f k8s/service.yaml'
                }
            }
        }
    }
}
