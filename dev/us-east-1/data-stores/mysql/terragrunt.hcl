include "root" {
    path = find_in_parent_folders()
}

terraform {
    source = "git@github.com:daniloavilez/terraform-playground.git//modules/data-stores/mysql?ref=main"
}

# Indicate what region to deploy the resources into
generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  region = "us-east-1"
}
EOF
}

inputs = {
    database_name = "mysql_dev"
    db_password = "batatinha"
    instance_class = "db.t2.micro"
}