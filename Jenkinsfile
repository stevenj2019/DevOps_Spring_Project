pipeline {
    agent any 
    stages{
        //stage('Test Code'){
        //    steps{
        //        sh "/home/jenkins/DevOps_Spring_Project/Jenkins_scripts/test_app.sh"
        //    }
        //}
        //stage('Build Java') {
        //   steps {
        //        sh "/home/jenkins/DevOps_Spring_Project/Jenkins_scripts/build_app.sh"
        //    }
        //}
        stage('Dockerize java Applications') {
            steps {
                sh "sudo bash ./Jenkins_scripts/build_image.sh ${BUILD_NUMBER}"
            }
        }
        stage('Build Infra') {
            steps {
                sh "bash ./Jenkins_scripts/build_infra.sh"
            }
        }
    }
}
