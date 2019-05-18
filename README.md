## Create a Jenkins Pipeline to Deploy a terraform Stack ##

### Setup ###

This is a lab to demonstrate using a Jenkinfile pipeline which will use docker and terraform to create resources in AWS

The ```build.sh``` file can be used to install Jenkins running on Centos7.

Docker is installed as the Jenkinsfile pipeline will run terraform in a Docker container

The Jenkins URL is http://127.0.0.1:8080

To get the Jenkins initial admin password, run this command:

```cat /var/lib/jenkins/secrets/initialAdminPassword```

After initializing Jenkins; install the recommended plugs and (optionally) the Blue Ocean plugin https://plugins.jenkins.io/blueocean

### Docker ###

IAM user AWS credentials should be saved on the host instance at `/root/.aws/` - these are mapped to and used by the Docker container when running the pipeline. Ensure the permissons for the IAM user are sufficient to complete all tasks/create all resources required by the pipeline

More information is available here: https://hub.docker.com/r/hashicorp/terraform

### Pipeline ###

Create a pipeline job, then within the **Pipeline** configuration set the definition to `Pipeline script from SCM`. Add your repository URL, the `Script Path` will automatically be set to Jenkinsfile.

In this example, the Jenkinsfile pipeline will create a security group in the default VPC in eu-west-2
