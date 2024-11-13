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
                    // Directly using username and password in the command
                    bat 'echo 22h51a05j2  | docker login -u rajkumar121 --password-stdin'
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
