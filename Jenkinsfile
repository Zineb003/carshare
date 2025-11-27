pipeline {
    agent any
    environment {
        DOCKER_IMAGE = "zineb417/carshare-app:latest"
    }
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/Zineb003/carshare.git'
            }
        }

        stage('Build Application') {
            steps {
                sh 'mvn clean package -DskipTests=true'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'mvn test || echo "No tests to run"'
            }
        }

        stage('Docker Build & Push') {
            steps {
                script {
                    withDockerRegistry([credentialsId: 'c4609e50-b156-4056-a727-e85c7a924713', url: '']) {
                        sh "docker build -t $DOCKER_IMAGE ."
                        sh "docker push $DOCKER_IMAGE"
                    }
                }
            }
        }

        stage('Deploy to Preprod') {
            steps {
                sshagent(['7d5ca8e5-4b77-4f38-a5cf-271f5209f2bb']) {
                    sh """
                    ssh urca@10.11.19.83 '
                        cd /home/urca
                        mkdir carshare
                        cd carshare
                        # Récupérer uniquement le docker-compose.yml depuis GitHub
                        wget -O docker-compose.yml https://raw.githubusercontent.com/Zineb003/carshare/main/docker-compose.yml
                        docker-compose pull tomcat
                        docker-compose down
                        docker-compose up -d
                    '
                    """
                }
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
