pipeline {
    agent any
    environment {
        IMAGE_NAME = 'udaysingh/devopstrainingdotnet'
        IMAGE_TAG = 'latest'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh 'dotnet build src/aspnetcore2/aspnetcore2/aspnetcore2.csproj --configuration Release'
            }
        }

        stage('Test') {
            steps {
                sh 'dotnet test src/aspnetcore2/aspnetcore2-testing/aspnetcore2-testing.csproj'
            }
        }
        stage('Docker Build') {
            steps {
                // Build your Docker image
                script {
                    docker.build("${IMAGE_NAME}:${IMAGE_TAG}")
                }
            }
        }
    }
}