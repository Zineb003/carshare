pipeline{
    agent any
    stages{
        stage('checkout'){
            steps{
                git url: 'https://github.com/Zineb003/carshare.git', branch: 'main'
        }
        }
        stage('build'){
            steps{
                sh 'mvn clean package -DskipTests'
            }
        }
    }
}
