# 環境の定義 (`dev.hcl`) を local.env.locals として参照できるようにする
locals {
  env = read_terragrunt_config(find_in_parent_folders("dev.hcl"))
}

# 全環境の定義 (`envs/terragrunt.hcl`) をインクルードする
include "root" {
  path = find_in_parent_folders()
}
# モジュールを参照する
terraform {
  source = "../../../modules/vpc"
}

inputs = {
  vpc_name = local.env.locals.vpc_name
  cidr_block = local.env.locals.cidr_block
  private_subnets = local.env.locals.private_subnets
  public_subnets  = local.env.locals.public_subnets
}
