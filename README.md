pipeline {
    agent any
    stage('Security Analysis (Checkmarx)') {
            steps {
                // Trigger Checkmarx scan
                script {
                    def checkmarxResult = sh(
                        script: '''
                            cxcli scan create \
                            --project-name "your-project-name" \
                            --source-location "." \
                            --location-type "folder" \
                            --scan-type "sast" \
                            --preset "Checkmarx Default" \
                            --username "your_checkmarx_username" \
                            --password "your_checkmarx_password" \
                            --url "http://your-checkmarx-server"
                        ''',
                        returnStatus: true
                    )

                    if (checkmarxResult != 0) {
                        error('Checkmarx scan failed! Please fix vulnerabilities.')
                    }
                }
            }
        }
    }

    post {
        always {
            // Archive the results (logs, reports, etc.)
            archiveArtifacts artifacts: '**/target/*.jar', allowEmptyArchive: true
        }

        success {
            echo 'Pipeline completed successfully!'
        }

        failure {
            echo 'Pipeline failed. Check the logs and fix the issues.'
        }
    }
}
