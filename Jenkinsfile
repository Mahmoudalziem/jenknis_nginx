pipeline{
    agent any
    environment{
        NAME="Mahmoud Abd Alziem"
        SCANNER_HOME=tool 'sonarQube'
        ORGANIZATION="microservices-github"
        PROJECT_NAME="test"
    }
    stages{
        stage('SonarQube Analysis') {
            steps{
                withSonarQubeEnv(installationName: 'sonarQube',credentialsId: 'sonarQube') {
                    sh ''' 
                          $SCANNER_HOME/bin/sonar-scanner 
                          -Dsonar.projectKey=test \
                          -Dsonar.sources=application/ \
                          -Dsonar.host.url=http://sonarqube.azima.website \
                          -Dsonar.login=d7f3c4bbb51bf6e9c1a754c37c72e2d6e8e9cae9
                    '''
                }
            }
        }
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
        stage("docker remove"){
            steps{
                catchError(message : "Message"){
                    sh '''
                        docker rm -f ecommerce
                    '''
                }
            }
        }
        stage("Run Docker image"){
            steps{
                catchError(message : "Message"){
                    sh '''
                        docker run -it -d -p 80:80 --name ecommerce azima/jenkins:${BUILD_NUMBER}
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
            slackSend color: "#fff", message: "Success Publish Ecommerce Application"
        }
        failure{
            slackSend color: "#000", message: "Failed Publish Ecommerce Application"
        }
    }
}
