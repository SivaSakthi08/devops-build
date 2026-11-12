
pipeline {
    agent any

    environment {
        DOCKER_USER = 'sivasakthi08'
    }

    stages {

        stage('Build') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'dev') {
                        env.IMAGE = "${DOCKER_USER}/dev:latest"
                    } else if (env.BRANCH_NAME == 'master') {
                        env.IMAGE = "${DOCKER_USER}/prod:latest"
                    } else {
                        error("Unsupported branch: ${env.BRANCH_NAME}")
                    }
                }

                sh 'docker build -t $IMAGE .'
            }
        }

        stage('Push') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'USER',
                    passwordVariable: 'PASS'
                )]) {
                    sh '''
                        echo "$PASS" | docker login -u "$USER" --password-stdin
                        docker push $IMAGE
                        docker logout
                    '''
                }
            }
        }

        stage('Deploy') {
            when {
                branch 'master'
            }
            steps {
                sh './deploy.sh "$EC2_HOST" "$SSH_KEY" "$IMAGE"'
            }
        }
    }
}

