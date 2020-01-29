pipeline {

  agent any

  environment {
    aws_access_key_id = credentials('aws_access_key_id')
    aws_secret_access_key = credentials('aws_secret_access_key')
  }

  stages {

    stage('build') {
      steps {
        sh './jenkins/build/node.sh npm install'
        sh './jenkins/build/node.sh npm run build'
        sh './jenkins/build/build.sh'
      }
      post {
        failure {
          sh 'docker rmi $JOB_NAME:$BUILD_TAG'
        }
      }
    }

    stage('deploy') {
      steps {
        sh './jenkins/deploy/deploy.sh'
      }
      post {
        failure {
          sh 'docker rmi $JOB_NAME:$BUILD_TAG'
        }
      }
    }

    stage('Clean Images') {
      when {
        not {
          branch 'master'
        }
      }
      steps {
        sh 'docker rmi $JOB_NAME:$BUILD_TAG'
      }
    }

  }
}
