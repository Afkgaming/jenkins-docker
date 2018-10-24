pipeline {
    agent any
    stages {
        stage("build-image"){
            steps{
                // If Dockerfile exists -> Build Image with ${BUILD_NUMBER} as image tag
                // else exit 1 with error message
                script{
                docker.build("newapp:${env.BUILD_NUMBER}")
                }
            }
        }
        stage("Container-creation+tests"){
            steps{
                // run container with the new Image:${BUILD_NUMBER}
                sh "echo 'Stage 2'"
            }
        }
        stage("push-image"){
            steps{
                // push image to dockerHub
                sh "echo 'Stage 3'"
            }
        }
    }
}