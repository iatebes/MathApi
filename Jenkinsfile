pipeline {
  agent any
  stages {
    stage('Clean docker image & container') {
      steps {
        sh 'docker rmi math-api'
        sh 'sudo docker stop web-math-api'
        sh 'sudo docker rm web-math-api'
      }
    }
    stage('Build & make docker image') {
      steps {
        sh 'docker build -t math-api .'
      }
    }
    stage('Run container') {
      steps {
        sh 'docker run -d -p 8088:8080 --name web-math-api math-api'
      }
    }
  }
}