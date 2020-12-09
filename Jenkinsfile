def testScript = libraryResource 'scripts/script.sh'
def MVN_SETTINGS = libraryResource 'maven-conf/settings.xml'
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
                  //  sh "${MVN_COMMAND_DEPLOY} -s ${MAVEN_SETTINGS_XML}"
                  // echo "${MVN_SETTINGS}"
                    sh "${MVN_COMMAND} -s settings.xml"
            //    }
                stash includes: '**/*', name: 'app'


            }
        }
    }
}