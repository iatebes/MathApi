pipeline {
  agent {
    node {
      label 'DockerLabel'
    }

  }
  stages {
    stage('Build') {
      steps {
        sh 'mvn package'
      }
    }
  }
}