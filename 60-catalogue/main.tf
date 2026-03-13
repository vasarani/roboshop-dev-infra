resource "aws_instance" "catalogue" {
  ami = local.ami_id
  instance_type = "t3.micro"
  subnet_id = local.private_subnet_id
  vpc_security_group_ids = [local.catalogue_sg_id]
 # iam_instance_profile = aws_iam_instance_profile.bastion.name

  tags = merge(
    local.common_tags,
    {
        Name = "${var.project}-${var.environment}-catalogue"
    }
  )

}

resource "terraform_data" "catalogue" {
  triggers_replace = [
    aws_instance.catalogue.id
  ]

  connection {
    type = "ssh"
    user = "ec2-user"
    password = "DevOps321"
    host = aws_instance.catalogue.private_ip
  }

  provisioner "file" {
    source = "bootstrap.sh" # Local file path
    destination = "/tmp/bootstrap.sh" # Destination path on the remote machine
  }

  provisioner "remote-exec" {
    inline = [ 
        "chmod +x /tmp/bootstrap.sh"

     ]
  }
  provisioner "remote-exec" {
    inline = [ 
         "sudo sh /tmp/bootstrap.sh catalogue dev"
     ]
  }
}