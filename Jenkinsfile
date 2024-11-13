pipeline {
    agent any 

    stages {
        stage('Checkout SCM') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                script {
                    bat 'docker build -t my-java-project:latest .'
                    bat 'docker tag my-java-project:latest rajkumar121/my-java-project:latest'
                }
            }
        }

        stage('Push') {
            steps {
                script {
                    // Use credentials securely
                    withCredentials([usernamePassword(credentialsId: 'rajkumar121', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        bat "echo %DOCKER_PASSWORD% | docker login -u %DOCKER_USERNAME% --password-stdin"
                    }
                    bat 'docker push rajkumar121/my-java-project:latest'
                }
            }
        }
        

        stage('Test') {
            steps {
                script {
                    // Run tests here if you have any
                    echo 'Running tests...'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Deploy your Docker image
                    bat 'minikube start'
                    bat 'kubectl apply -f deployment.yaml'
                    bat 'kubectl apply -f service.yaml'
                    bat 'minikube dashboard'
                    bat 'kubectl get services'
                    echo 'Deploying application...'
                }
            }
        }
    }
}
