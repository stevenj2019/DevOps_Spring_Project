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
                sh "/home/jenkins/.jenkins/workspace/Spring/Jenkins_scripts/build_image.sh"
            }
        }
        stage('Build Infra') {
            steps {
                sh "/home/jenkins/.jenkins/workspace/Spring/Jenkins_scripts/build_infra.sh"
            }
        }
    }
}