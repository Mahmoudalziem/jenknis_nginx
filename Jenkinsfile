pipeline{
    agent{
        label "ec2"
    }
    environment{
        NAME="Mahmoud Abd Alziem"
    }
    stages{
        stage('build'){
            steps{
                echo "My Name ${env.NAME}"
                sh '''
                pwd
                ls
                date
                '''
            }
        }
        stage('test'){
            steps{
             catchError(message : "Message"){
                 echo test
             }
            }
        }
        stage('deploy'){
            steps{
                withCredentials([usernamePassword(credentialsId: 'DOCKER_AUTH', passwordVariable: 'pass', usernameVariable: 'user')]) {
                    sh '''
                    docker login -u ${user} -p ${pass}
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
            slackSend color: "good", message: "Message from Jenkins Pipeline"
        }
    }
}