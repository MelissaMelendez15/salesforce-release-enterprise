pipeline {
    agent any

    options {
        skipDefaultCheckout(false)
        timestamps()
        disableConcurrentBuilds()
        timeout(time: 30, unit: 'MINUTES')
    }

    environment {
        SF_ORG_ALIAS = 'release-org'
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Debug Branch') {
           steps {
              sh '''
                 echo "BRANCH_NAME=$BRANCH_NAME"
                 echo "GIT_BRANCH=$GIT_BRANCH"
                 git branch -a
             '''
            }
        }

        stage('Authenticate Salesforce') {
            steps {
                withCredentials([
                    string(credentialsId: 'SF_AUTH_URL', variable: 'SF_AUTH_URL')
                ]) {
                    sh '''
                        echo "$SF_AUTH_URL" > auth-url.txt

                        sf org login sfdx-url \
                          --sfdx-url-file auth-url.txt \
                          --alias "$SF_ORG_ALIAS"

                        sf org display \
                          --target-org "$SF_ORG_ALIAS"
                    '''
                }
            }
        }

        stage('Validate') {
            steps {
                sh '''
                    sf project deploy validate \
                      --source-dir force-app \
                      --target-org "$SF_ORG_ALIAS" \
                      --test-level RunLocalTests
                '''
            }
        }

        stage('Deploy Develop') {
            when {
                expression { 
                    env.BRANCH_NAME == 'develop' 
                }
            }
            steps {
                sh '''
                    sf project deploy start \
                      --source-dir force-app \
                      --target-org "$SF_ORG_ALIAS" \
                      --test-level RunLocalTests
                '''
            }
        }

        stage('Deploy UAT') {
            when {
                expression { 
                    env.BRANCH_NAME == 'uat' 
                }
            }
            steps {
                sh '''
                    sf project deploy start \
                      --source-dir force-app \
                      --target-org "$SF_ORG_ALIAS" \
                      --test-level RunLocalTests
                '''
            }
        }

        stage('Manual Approval') {
            when {
                expression { 
                    env.BRANCH_NAME == 'main' 
                }
            }
            steps {
                input message: '¿Aprobar despliegue a Producción?', ok: 'Deploy Production'
            }
        }

        stage('Deploy Production') {
            when {
                expression { 
                    env.BRANCH_NAME == 'main' 
                }
            }
            steps {
                sh '''
                    sf project deploy start \
                      --source-dir force-app \
                      --target-org "$SF_ORG_ALIAS" \
                      --test-level RunLocalTests
                '''
            }
        }
    }

    post {
        always {
            sh 'rm -f auth-url.txt'
        }
    }
}
