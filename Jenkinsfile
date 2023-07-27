pipeline {
    agent any
    tools {
        terraform 'terraform'
    }
    stages {
        stage('Checking Out') {
            steps {
                echo '**Pulling Repository**'
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/jamesbarker15/terraform-pipeline.git']])
            }
        }
        stage('Terraform Apply') {
            steps {
                // Apply Terraform configuration to create EC2 instance
                sh 'terraform init'
                sh 'terraform apply -auto-approve'

                // Capture Terraform output and store it in a variable
                script {
                    EC2_PUBLIC_IP = sh(returnStdout: true, script: 'terraform output -raw ec2_public_ip').trim()
                }
            }
        }
        stage("Pipeline Complete") {
            steps {
                echo "Pipeline Complete"

                }
            }
        }
    }