pipeline {
    agent any

    environment {
        IMAGE_NAME = "carshare:latest"
        PREPROD_CONTAINER = "carshare-preprod"
        PREPROD_HOST = "10.11.19.83"
    }

    stages {
        stage('Clone Repository') {
            steps {
                echo "Clonage du projet manuellement..."
                sh """
                rm -rf carshare
                git clone /opt/git/carshare.git carshare
                """
            }
        }

        stage('Build Maven') {
            steps {
                echo "Compilation du projet avec Maven..."
                sh 'cd carshare && mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Construction de l'image Docker..."
                sh 'cd carshare && docker build -t $IMAGE_NAME .'
            }
        }

        stage('Deploy Preprod') {
            steps {
                echo "Déploiement sur le serveur préproduction $PREPROD_HOST..."
                sshagent(credentials: ['7d5ca8e5-4b77-4f38-a5cf-271f5209f2bb']) {
                    sh """
                    # Sauvegarde de l'image
                    docker save $IMAGE_NAME -o carshare_latest.tar

                    # Copier sur la préprod
                    scp carshare_latest.tar urca@$PREPROD_HOST:~/

                    # Charger et lancer sur préprod
                    ssh urca@$PREPROD_HOST '
                        docker load -i carshare_latest.tar
                        docker stop $PREPROD_CONTAINER || true
                        docker rm $PREPROD_CONTAINER || true
                        docker run -d -p 8080:8080 --name $PREPROD_CONTAINER $IMAGE_NAME
                    '
                    """
                }
            }
        }
    }
}

