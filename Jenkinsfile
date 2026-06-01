pipeline {
    agent any

    options {
        skipDefaultCheckout(false)
        timestamps()
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
                      --test-level NoTestRun
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
