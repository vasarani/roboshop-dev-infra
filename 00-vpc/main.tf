module "vpc" {
  source = "../../Terraform-aws-vpc"
  project = var.project
  environment = var.environment
  is_peering_required = true

  
}