def mavenPod = libraryResource 'podtemplates/podTemplate-maven.yaml'
def kanikoPod = libraryResource 'podtemplates/podTemplate-kaniko.yaml'
def testScript = libraryResource 'scripts/script.sh'
//def MVN_SETTINGS = libraryResource 'maven-conf/settings.xml'
def MVN_COMMAND_PACKAGE = 'mvn -q clean package -Dembedd-dependencies -Dmaven.repo.local=/tmp/.m2'
def MVN_COMMAND_DEPLOY = "mvn -q -Dembedd-dependencies -Dmaven.repo.local=/tmp/.m2 clean deploy "
pipeline {
    agent none
    stages {
        stage('Print message') {
            steps {
                echo "Hello, world!"
            }
        }
    }
}