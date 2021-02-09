pipeline {   
  agent {
    node {
      label 'node-01'
    }  
  }

  environment {
    PATH="/usr/local/bin:$PATH"
  }

  stages {
    stage('init') {
      steps {
        sh 'terraform init'
      }
    }
    stage('plan') {
      steps {
        sh 'terraform plan'
      }
    }
    stage('approval') {
      options {
        timeout(time: 1, unit: 'HOURS') 
      }
      steps {
        input 'approve the plan to proceed and apply'
      }
    }
    stage('apply') {
      steps {
        sh 'terraform apply -auto-approve'
        cleanWs()
      }
    }
  }
}
