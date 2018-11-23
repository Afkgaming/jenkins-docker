pipeline {
    agent {label 'master'}
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
                sh "curl localhost:1234"
                sh "sleep 120"
                sh "docker stop nginx-test"
            }
        }
        stage("push-image"){
            steps{
                // push image to dockerHub
                withDockerRegistry(credentialsId: 'docker-hub', url: "") {
                    sh "docker push virusoo/newapp:${env.BUILD_NUMBER}"
                    sh "docker tag virusoo/newapp:${env.BUILD_NUMBER} virusoo/newapp:latest"
                    sh "docker push virusoo/newapp:latest"
                    sh "echo 'image push successful!'"
                }
            }
        }
	stage("trigger-job"){
		build job: 'dockerfile-deploy'
    }
}
