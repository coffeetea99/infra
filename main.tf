terraform {
  required_version = "~> 1.4.6"

  cloud {
    organization = "coffeetea99"

    workspaces {
      name = "infra"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.66.1"
    }
  }
}

provider "aws" {
  region = "ap-northeast-2"
}
