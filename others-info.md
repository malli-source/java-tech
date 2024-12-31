parallel job execution############################

pipeline { agent any

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
