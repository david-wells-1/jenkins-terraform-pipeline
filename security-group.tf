provider "aws" {
  region = "eu-west-2"
}

resource "aws_security_group" "jenkins-pipeline" {
  name        = "jenkins-pipeline"
  description = "built-by-jenkins-pipeline"
}
