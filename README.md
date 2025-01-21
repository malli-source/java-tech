pipeline {
    agent any
    stages {
        stage('Checkmarx Scan') {
            steps {
                checkmarxScan(
                    serverUrl: 'https://your-checkmarx-server',
                    username: 'your-username',
                    password: 'your-password',
                    projectName: 'your-project-name',
                    teamPath: '\\CxServer\\SP\\your-team',
                    isIncrementalScan: true,
                    generatePDFReport: true
                )
            }
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
