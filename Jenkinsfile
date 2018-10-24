pipeline {
    agent any
    stages {
        stage("build-image"){
            steps{
                // If Dockerfile exists -> Build Image with ${BUILD_NUMBER} as image tag
                // else exit 1 with error message
                /*script{
                    if(new File('Dockerfile').exists()){
                        docker.build("virusoo/NewApp:${BUILD_NUMBER}")
                    }else{
                        echo "There is no Dockerfile" && exit 1
                    }
                }*/
                sh "echo 'Stage 1'"
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