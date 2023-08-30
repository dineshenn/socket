pipeline {
    agent any

    stages {
        stage('Git checkout') {
            steps {
                git branch: 'main', credentialsId: 'credential', url: 'https://github.com/sharath71/bottomline.git'
            }
        }
        stage('maven build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Docker build') {
            steps {
                sh 'docker build -t sharath71/sharath71-botli:0.0.1 .'
            }
        }
        stage('Docker Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker_hub', passwordVariable: 'pwd', usernameVariable: 'user')]) {
                    sh "docker login -u ${user} -p ${Pwd}"
                    sh "docker push sharath71/sharath71-botli:0.0.1"
                }
                
            }
            
        }
            
    }
}
