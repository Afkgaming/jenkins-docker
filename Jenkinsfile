pipeline {
    agent any
    stages {
        stage("build-image"){
            steps{
                // If Dockerfile exists -> Build Image with ${BUILD_NUMBER} as image tag
                // else exit 1 with error message
                script{
                    if(new File('Dockerfile').exists()){
                        docker.build("virusoo/NewApp:${BUILD_NUMBER}")
                    }else{
                        echo "There is no Dockerfile" && exit 1
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
            // push image to dockerHub
        }
    }
}
