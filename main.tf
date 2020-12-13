terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "ryno-lab"

    workspaces {
      name = "taxhelper-infra"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

provider "aws" {
  profile = "codebase-admin"
  region  = "ap-southeast-2"
}

resource "aws_instance" "example" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"
}
