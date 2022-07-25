pipeline {
    agent {
        label 'ec2'
    }
    tools{
        git
    }
    stages {
        stage('build'){
            steps{
                    sh '''
                        docker build -it azima/jenkins:{BUILD_NUMBER} .
                    '''
                
            }
        }
        stage('deploy'){
            steps{
                withCredentials([usernamePassword(credentialsId: 'docker_cer', passwordVariable: 'pass', usernameVariable: 'user')]){
                    sh '''
                        docker login -u ${user} -p {pass}
                        docker push azima/jenkins:{BUILD_NUMBER}
                        echo done
                    '''
                }
            }

        }
    }

    post {
        always {
            echo "==== Always ====="
        }
        success {
            echo "====== Success ===="
        }
        failure {
            echo "========= Failure ====="
        }
    }
}