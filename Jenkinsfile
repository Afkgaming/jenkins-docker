pipeline {
    agent any
    stages {
        stage("build-image"){
            steps{
                // If Dockerfile exists -> Build Image with ${BUILD_NUMBER} as image tag
                // else exit 1 with error message
                script{
                def newImage = docker.build("virusoo/newapp:${env.BUILD_NUMBER}")
                
                    newImage.inside{
                        sh 'curl localhost'
                    }
                }
            }
        }
        stage("Container-creation+tests"){
            steps{
                // run container with the new Image:${BUILD_NUMBER}
            }
        }
        stage("push-image"){
            steps{
                // push image to dockerHub
                withDockerRegistry(credentialsId: 'docker-hub', url: "") {
                    sh "docker push virusoo/newapp:${env.BUILD_NUMBER}"
                    sh "echo 'image push successful!'"
                }
            }
        }
    }
}