FROM cloudbees/codeship-jenkinsfile-step:latest

# Install plugins
# TODO: All these plugins are actually bundled, need something else for the demo
RUN java -jar /app/bin/jenkins-plugin-manager.jar \
  --war /app/jenkins/jenkins.war \
  --plugins docker-workflow:1.24 \
  workflow-durable-task-step:2.36 \
  pipeline-model-definition:1.7.2 \
  docker-plugin:1.2.0
 # configuration-as-code:1.43

# Configuration as code, goes to the default location
COPY jenkins.yaml /jenkins/config.yaml.d/jenkins.yaml