pipeline {
    agent any
    stages {
      stage('SCM') {
        steps {
            git branch: 'main', url: 'https://github.com/malli-source/java-tech.git'
        } 
      }
      stage('Code Compile') {
        steps {
             sh 'mvn -f javatechbase/pom.xml -B clean package'
        }
      }
      stage('Build Image') {
        steps {
          script {
                sh 'docker build -t javatech-app:1.0 .'
          }
        }
      }
      stage('push docker image') {
        steps {
          script {
            withCredentials([string(credentialsId: 'dockersecret', variable: 'dockerhubuser')]) {
                sh 'docker login -u malli118 -p ${dockerhubuser}'
            }
                sh 'docker push malli118/sonarqube/javetech-app:1.0'
          }
        }
      }
    }
}
