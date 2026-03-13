locals {
  catalogue_sg_id = data.aws_ssm_parameter.catalogue_sg_id.value
  private_subnet_id = split(",", data.aws_ssm_parameter.private_subnet_ids.value)[0]
  ami_id = data.aws_ami.joindevops
  common_tags = {
    project     = "roboshop"
    environment = "dev"
    Terraform   = "true"
  }

}