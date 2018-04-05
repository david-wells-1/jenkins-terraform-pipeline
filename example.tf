terraform {
  backend "s3" {
    bucket  = "jenkins-pipeline-state"
    key     = "jenkins-pipeline-state.tfstate"
    encrypt = true
    region  = "eu-west-2"
  }
}

data "aws_caller_identity" "current_user" {}

provider "aws" {
  region = "eu-west-2"
}

resource "aws_security_group" "jenkins-pipeline-sg" {
  name        = "jenkins-pipeline-sg"
  description = "built-by-jenkins-pipeline"
}
