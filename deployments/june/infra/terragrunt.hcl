locals {
  environment                 = "sandbox"
  account_name                = "retool-sandbox"
  terragrunt_role_environment = "sandbox"
  aws_account_id              = "095027729292"
  aws_region                  = "us-west-2"
  client_name                 = "june"
  profile                     = "sandbox"

  provider_tags = {
    Environment = local.environment
    Terraform   = "true"
  }
}


terraform {
  source = "tfr:///terraform-aws-modules/vpc/aws?version=3.18.1"
}

inputs = merge(
  local,
  {
    vpc_name              = "${local.client_name}-vpc"
    cidr                  = "10.2.0.0/16"
    azs                   = ["us-west-2a", "us-west-2b", "us-west-2c"]
    public_subnets        = ["10.2.0.0/20"]
    public_subnets_suffix = "pub"
    public_subnet_names   = ["${local.client_name}-${local.environment}-pub-${local.aws_region}-subnet"]
    private_subnets       = ["10.2.0.0/20"]
    private_subnet_suffix = "app"
    private_subnet_names  = ["${local.environment}-app-${local.aws_region}-subnet"]

    enable_nat_gateway            = true
    enable_vpn_gateway            = false
    manage_default_network_acl    = true
    manage_default_security_group = true
    enable_dns_hostnames          = true

    tags = {
      "Team"    = "infra"
      "Project" = "General Networking"
    }

    igw_tags = {
      Name = "${local.environment}-vpc-igw"
    }

    public_route_table_tags = {
      Name = "${local.environment}-vpc-public-rt"
    }

    create_database_subnet_route_table = true
  }
)

# Generate an AWS provider block
generate "provider" {
  path      = "provider.tf"
  if_exists = "skip"
  contents  = <<EOF
variable "provider_tags" {
   type = map
}

provider "aws" {
  profile = "${local.profile}"
  region = "${local.aws_region}"
  default_tags {
   tags = var.provider_tags
  }
}
EOF
}
