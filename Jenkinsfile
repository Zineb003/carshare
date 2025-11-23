pipeline{
    agent any

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
                sh 'docker build -t carshare-app .'
            }
        }
        stage('Deploy Application'){
            steps{
                //Exécuter le conteneur Docker
                sh 'docker-compose down' // arreter les conteneurs en cours d'exécution
                sh 'docker-compose up -d' //démarrer les conteneurs en arrière-plan sur les bons ports
            }
        }
    }
}
