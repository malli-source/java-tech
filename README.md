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


##############parallel job execution#######################

pipeline {
    agent any

    stages {
        stage('Parallel Execution') {
            parallel {
                stage('Job 1') {
                    steps {
                        echo 'Executing Job 1...'
                        // Add your specific commands here
                        sh 'sleep 5'  // Simulates a task
                        echo 'Job 1 Completed'
                    }
                }
                stage('Job 2') {
                    steps {
                        echo 'Executing Job 2...'
                        // Add your specific commands here
                        sh 'sleep 3'  // Simulates a task
                        echo 'Job 2 Completed'
                    }
                }
                stage('Job 3') {
                    steps {
                        echo 'Executing Job 3...'
                        // Add your specific commands here
                        sh 'sleep 4'  // Simulates a task
                        echo 'Job 3 Completed'
