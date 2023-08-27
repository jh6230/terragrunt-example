locals {
  env = read_terragrunt_config(find_in_parent_folders("dev.hcl"))
}

# 全環境の定義 (`envs/terragrunt.hcl`) をインクルードする
include "root" {
  path = find_in_parent_folders()
}
# モジュールを参照する
terraform {
  source = "../../../modules/s3"
}

inputs = {
  bucket_name = "${local.env.locals.env}-445605964569"
}
