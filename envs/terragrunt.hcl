remote_state {
  backend = "s3"
  config = {
    region  = "ap-northeast-1"
    bucket  = "terragrunt-example-tfstate-445605964569"
    key     = "${path_relative_to_include()}/terraform.tfstate"
    encrypt = true
  }
  generate = {
    path      = "_backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
terraform {
  required_version = ">= 1.5.5"

  required_providers {
    aws = {
      # See https://github.com/terraform-providers/terraform-provider-aws
      version = "~> 5.1.0"
    }
  }
}
provider "aws" {
  region = "ap-northeast-1"
}
EOF
}
