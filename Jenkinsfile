pipeline {
    agent any 

    stages {
        stage('Build') {
            steps {
                script {
                    bat 'docker build -t my-java-project .'
                     bat 'docker tag my-java-project rajkumar121/my-java-project:latest'
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
                   //  Deploy your Docker image
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
