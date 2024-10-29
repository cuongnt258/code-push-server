def remote=[:]
remote.name = 'ubuntu'
remote.user = 'root'
remote.host = 'tancuong.dev'
remote.allowAnyHosts = true

pipeline {
    agent any

		options {
        // This will automatically cancel any running instances of the job when a new one is triggered
        disableConcurrentBuilds() 
		}

    environment {
        UBUNTU_CREDS=credentials('ubuntu')
    }
    
    stages {
        stage('master') {
            steps {
                script {
                    remote.password = env.UBUNTU_CREDS_PSW
                    slackSend channel: 'code-push-log', color: '#FAFAFA', message: "START: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})"
										sshCommand(remote: remote, command: 'cd server/code-push-server/ && sh .shells/deploy.sh')
                } 
            }
        }
    }
    post {
        success {
            slackSend channel: 'code-push-log', color: '#00FF00', message: "SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})"
        }
        failure {
            slackSend channel: 'code-push-log', color: '#FF0000', message: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})"
        }
        aborted {
            slackSend channel: 'code-push-log', color: '#FF0000', message: "ABORTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})"
        }
    }
}