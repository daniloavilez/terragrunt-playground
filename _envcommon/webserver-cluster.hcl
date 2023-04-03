# ---------------------------------------------------------------------------------------------------------------------
# COMMON TERRAGRUNT CONFIGURATION
# This is the common component configuration for webserver-cluster. The common variables for each environment to
# deploy webserver-cluster are defined here. This configuration will be merged into the environment configuration
# via an include block.
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  source = "${local.base_source_url}?ref=main"
}

# ---------------------------------------------------------------------------------------------------------------------
# Locals are named constants that are reusable within the configuration.
# ---------------------------------------------------------------------------------------------------------------------
locals {
  # Automatically load environment-level variables
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  # Extract out common variables for reuse
  env = local.environment_vars.locals.environment

  # Expose the base source URL so different versions of the module can be deployed in different environments.
  base_source_url = "git@github.com:daniloavilez/terraform-playground.git//modules/services/webserver-cluster"
}

# ---------------------------------------------------------------------------------------------------------------------
# MODULE PARAMETERS
# These are the variables we have to pass in to use the module. This defines the parameters that are common across all
# environments.
# ---------------------------------------------------------------------------------------------------------------------
inputs = {
    cluster_name              = "webserver-${local.env}"
    instance_type             = "t2.micro"
    db_remote_state_bucket    = "terraform-study-code-demo"
    db_remote_state_key       = "data-stores/mysql/terraform.tfstate"
    min_size                  = 2
    enable_autoscaling        = 0
    enable_new_user_data      = 1
}