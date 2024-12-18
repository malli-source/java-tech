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
             bat 'mvn -f javatechbase/pom.xml -B clean package'
        }
      }
      stage('Build Image') {
        steps {
            bat 'docker build -t malli118/sonarqube:javaApp .'
        }
      }
      stage('dockerbuild') {
        steps {
          script {
            withCredentials([string(credentialsId: 'dockersecret', variable: 'dockerhubuser')]) {
                bat 'docker login -u malli118 -p ${dockerhubuser}'
            }
                bat 'docker push malli118/sonarqube'
          }
        }
      }
    }
}
