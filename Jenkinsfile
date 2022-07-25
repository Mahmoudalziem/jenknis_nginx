pipeline {
    agent {
        label 'ec2'
    }
    stages {
        stage('build'){
            steps{
                withCredentials([usernamePassword(credentialsId: 'docker_cer', passwordVariable: 'pass', usernameVariable: 'user')]){
                    sh '''
                        docker build -it azima/jenkins:{BUILD_NUMBER} .
                    '''
                }
            }
        }
        stage('deploy'){
            steps{
                sh '''
                    docker login -u ${user} -p {pass}
                    docker push azima/jenkins:{BUILD_NUMBER}
                    echo done
                '''
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