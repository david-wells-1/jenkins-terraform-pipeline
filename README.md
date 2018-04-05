## Create a Jenkins Pipeline to Deploy a terraform Stack ##

### Setup ###

The ```build.sh``` file can be used to install Jenkins running on Centos7; within a Development environment. Docker is installed as the pipeline will run terraform in a Docker container

The Jenkins URL is ```http://<host-ip-address>:8080```

Run this command to get the initial admin password for Jenkins login:

```cat /var/lib/jenkins/secrets/initialAdminPassword```

Post installation of Jenkins, manually install:
1. The recommended plugins
2. The Blue Ocean plugin
3. The AnsiColor Plugin

### Docker ###

IAM user AWS credentials should be saved on the host instance - these are mapped to and used by the Docker container when running the pipeline; the permissons for the IAM user will need to be sufficient to complete all tasks/create all resources required by the pipeline

More information is available here: https://github.com/hashicorp/docker-hub-images/tree/master/terraform

### Pipeline ###

Use the ```Jenkinsfile``` to create the pipeline

As an example, the ```example.tf``` will create a security group in the default VPC in eu-west-2

