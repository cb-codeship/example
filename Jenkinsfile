def mavenPod = libraryResource 'podtemplates/podTemplate-maven.yaml'
def kanikoPod = libraryResource 'podtemplates/podTemplate-kaniko.yaml'
def testScript = libraryResource 'scripts/script.sh'
//def MVN_SETTINGS = libraryResource 'maven-conf/settings.xml'
def MVN_COMMAND_PACKAGE = 'mvn -q clean package -Dembedd-dependencies'
pipeline {
    agent { label: "" }
    stages {
        stage('Print message') {
            steps {
                echo "Hello, world!"
            }
        }
        stage("build") {
            agent {
                kubernetes {
                    label 'mavenPod'
                    defaultContainer "maven"
                    yaml mavenPod
                }
            }
            steps {

                // git url: 'https://github.com/pipeline-template-apps/maven-executable-jar-example.git', branch: 'master'
                // sh "ls -l"
             //   configFileProvider([configFile(fileId: 'global-maven-settings', variable: 'MAVEN_SETTINGS_XML')]) {
                  //  sh "${MVN_COMMAND_DEPLOY} -s ${MAVEN_SETTINGS_XML}"
                    sh "${MVN_COMMAND_DEPLOY} "
            //    }
                stash includes: '**/*', name: 'app'


            }
        }
    }
}