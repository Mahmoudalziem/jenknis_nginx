pipeline{
    agent any
    environment{
        NAME="Mahmoud Abd Alziem"
    }
    stages{
        stage('build'){
            steps{
                sh '''
                    docker build -t azima/jenkins:${BUILD_NUMBER} .
                '''
            }
        }
        stage('Docker Login'){
            steps{
             catchError(message : "Message"){
                 withCredentials([usernamePassword(credentialsId: 'DOCKER_AUTH', passwordVariable: 'pass', usernameVariable: 'user')]) {
                    sh '''
    		        docker login -u ${user} -p ${pass}
                    echo done
                    '''
                } 
             }                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
            }
        }
        stage('Push Image'){
            steps{
                catchError(message : "Message") {
                    sh '''
                        docker push azima/jenkins:${BUILD_NUMBER}
                        echo done
                    '''
                }
            }
        }
        stage("Run Docker image"){
            steps{
                catchError(message : "Message"){
                    sh '''
                        docker rm -f ecommerce
                        docker run -it -d -p 8080:80 --name ecommerce azima/jenkins:${BUILD_NUMBER}
                        echo done
                    '''
                }
            }
        }
    }

    post{
        always{
            echo "Start Stages Pipeline"
        }
        success{
            slackSend color: "#fff", message: "Message from Jenkins Pipeline"
        }
        failure{
            slackSend color: "#000", message: "Message from Jenkins Pipeline"
        }
    }
}