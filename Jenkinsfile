pipeline{
    agent any
    environment {
        DOCKER_IMAGE = "zineb003/carshare-app:latest"
    }
    stages{
        stage('Clone Repository'){
            steps{
                //Récupérer le code source depuis le dépôt Git
                git branch: 'main', url: 'https://github.com/Zineb003/carshare.git'
                
            }
        }
        stage('Build Application'){
            steps{
                //Construire l'application avec Maven et ignorer les tests (création du package .war)
                sh 'mvn clean package -DSkipTests=true'
            }
        }
        stage('Run Tests'){
            steps{
                sh 'mvn test'
            }
        }
        stage('Docker build'){
            steps{
                //construire l'image docker
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }
        stage('push docker image to Docker Hub'){
            steps{
                 withDockerRegistry([credentialsId: 'c4609e50-b156-4056-a727-e85c7a924713', url: '']) {
                 sh 'docker push $DOCKER_IMAGE'
                }
            }
        }

         /* stage('Deploy Application'){
            steps{
                //Exécuter le conteneur Docker
                sh 'docker-compose down' // arreter les conteneurs en cours d'exécution
                sh 'docker-compose up -d' //démarrer les conteneurs en arrière-plan sur les bons ports
            }
        } 
        stage('Deploy Application to préprod-server'){
            steps{
                //Déployer l'application sur le servueur de préproduction
                sshagent(['preprod-ssh-key']){
                    sh ''' 
                    ssh jenkins@preprod-server "
                    docker pull toncompte/carshare-app:latest
                    docker compose down
                    docker compose up -d
                    "
                    '''
                }
            }
        }*/

    }
}
