pipeline{
    agent any
    environment{
        NAME="Mahmoud Abd Alziem"
    }
    stages{
        stage('SonarQube Analysis') {
            steps{
                withSonarQubeEnv(credentialsId: 'sonarQube') {
                    sh '''
                        /var/lib/jenkins/tools/hudson.plugins.sonar.SonarRunnerInstallation/SonarQube/bin/sonar-scanner \
                        -D sonar.projectVersion=1.0-SNAPSHOT \
                        -D sonar.login=admin \
                        -D sonar.password=root \
                        -D sonar.projectBaseDir=/var/lib/jenkins/workspace/test/ \
                        -D sonar.projectKey=test \
                        -D sonar.sourceEncoding=UTF-8 \
                        -D sonar.language=html \
                        -D sonar.sources=application/ \
                        -D sonar.host.url=http://sonarqube.azima.website/
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
