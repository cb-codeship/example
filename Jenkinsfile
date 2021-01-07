def testScript = libraryResource 'scripts/script.sh'
def MVN_COMMAND = 'mvn -e clean deploy -Dembedd-dependencies'
pipeline {
    agent any
    stages {
        stage('Print message') {
            steps {
                echo "Hello, world!"
            }
        }
        stage("build") {
            steps {

                // git url: 'https://github.com/pipeline-template-apps/maven-executable-jar-example.git', branch: 'master'
                // sh "ls -l"
                //   configFileProvider([configFile(fileId: 'global-maven-settings', variable: 'MAVEN_SETTINGS_XML')]) {

                //echo "${MVN_SETTINGS}"
                sh "${MVN_COMMAND} -s settings.xml"
                sh label: 'script', returnStdout: true, script: """${testScript}"""
                //    }
                stash includes: '**/*', name: 'app'


            }
        }

        stage("Run parallel sequences") {
            parallel {
                stage("Test Firefox") {
                    //  agent { label: "docker" }
                    options {
                        skipDefaultCheckout(true)
                    }
                    stages {
                        stage("prepare test") {
                            steps {
                                sh "echo TODO test prepare FireFox...."
                                timeout(time: 3, unit: 'MINUTES') {
                                    retry(5) {
                                        //call external shell script
                                        sh "echo ${testScript}"
                                    }
                                }
                            }
                        }
                        stage("run test") {
                            steps {
                                sh "echo TODO test FireFox"

                            }
                        }
                    }
                }

                stage("Test Chrome") {
                    //  agent { label: "docker" }
                    options {
                        skipDefaultCheckout(true)
                    }
                    stages {
                        stage("prepare test") {
                            steps {
                                unstash 'app'
                                sh "echo TODO test prepare Chrome...."
                                timeout(time: 3, unit: 'MINUTES') {
                                    retry(5) {
                                        //call external shell script
                                        sh "echo ${testScript}"
                                    }
                                }
                            }
                        }
                        stage("run test") {
                            steps {
                                sh "echo TODO test Chrome"
                            }
                        }
                    }
                }
            }
        }

        stage("Docker") {
            when {
                branch 'master'
            }

            options {
                skipDefaultCheckout(true)
            }
            steps {
              //  sh "docker version"
               sh """ docker run \
     -v .:/workspace \
    gcr.io/kaniko-project/executor:latest \
    --dockerfile Dockerfile \
    --destination "caternberg/$IMAGE_NAME:$TAG" \
    --context dir:///workspace/
    """
            }
            post {
                success {
                    echo "Docker Build Successfully"
                    //Slack notification....
                    //Jira update
                }
                failure {
                    echo "Docker Build Failed"
                    //Slack notification....
                    //Jira update
                }
            }
        }
    }
}