pipeline{
    agent any
    stages{
        stage('checkout'){
            steps{
                git branch: 'main', 
                url: 'https://github.com/Zineb003/carshare.git',
                credentialsId: 'ca991401-8709-452e-98fe-f46aca9ed83c'
        }
        }
        stage('build maven'){
            steps{
                sh 'mvn clean package -DskipTests'
            }
        }
        stage('Docker Build'){
            steps{
                script{
                    // se connecter à Docker Hub avec les crédentials stockées dans Jenkins
                    docker.withRegistry('https://index.docker.io/v1/', 'c4609e50-b156-4056-a727-e85c7a924713') {
                        // Construire et pousser l'image Docker depuis le dockerfile
                        def app = docker.build("zineb417/carshare-tomcat:latest", ".")
                        // Pousser l'image Docker vers Docker Hub
                        app.push()
            }
        }

    }
        }
    stage("Deploy to Preprod"){
        steps{
            sshagent(['7d5ca8e5-4b77-4f38-a5cf-271f5209f2bb']) { // Remplace par l’ID de ta clé SSH
            sh '''
                ssh -o StrictHostKeyChecking=no urca@10.11.19.83 "
                    docker pull zineb417/carshare-tomcat:latest &&
                    docker stop carshare-preprod || true &&
                    docker rm carshare-preprod || true &&
                    docker run -d --name carshare-preprod -p 8080:8080 zineb417/carshare-tomcat:latest
                "
            '''
        }
}
    }
}
    }

