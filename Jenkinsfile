pipeline {
  agent any
  stages {
    stage('Clean docker image & container') {
      steps {
        sh 'chmod +x del_container.sh'
        sh './del_container.sh web-math-api'
        sh 'chmod +x del_image.sh'
        sh './del_image.sh math-api:latest'
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