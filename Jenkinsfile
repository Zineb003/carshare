pipeline{
    agent any
    stages{
        stage('checkout'){
            steps{
                git branch: 'main', 'https://github.com/Zineb003/carshare.git'
        }
        }
        stage('build'){
            steps{
                sh 'mvn clean package -DskipTests'
            }
        }
    }
}
