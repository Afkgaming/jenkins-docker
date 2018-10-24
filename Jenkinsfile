pipeline {
    agent master
    stages {
        stage("build-image"){
            steps{
                // If Dockerfile exists -> Build Image with ${BUILD_NUMBER} as image tag
                // else exit 1 with error message
                script{
                def newImage = docker.build("virusoo/newapp:${env.BUILD_NUMBER}")
                }
                
            }
        }
        stage("Container-creation+tests"){
            steps{
                // run container with the new Image:${BUILD_NUMBER}
                sh "docker run -p 1234:80 --name nginx-test -d --rm virusoo/newapp:${env.BUILD_NUMBER}"
                sh "docker ps -a"
                sh "curl 172.17.0.2"
                sh "docker stop nginx-test"
            }
        }
        stage("push-image"){
            steps{
                // push image to dockerHub
                withDockerRegistry(credentialsId: 'docker-hub', url: "") {
                    sh "docker push virusoo/newapp:${env.BUILD_NUMBER}"
                    sh "sleep 60s"
                    sh "echo 'image push successful!'"
                }
            }
        }
    }
}