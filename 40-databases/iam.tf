resource "aws_iam_role" "mysql" {
  name = local.mysql_role_name #Roboshop-Dev_Mysql

  assume_role_policy = jsonencode({
    version = "2012-10-17"
    Statement = [
        {
            Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid = ""
        Principal = {
            Service = "ec2.amazonaws.com"
        }
        },
    ]
  })

  tags = merge(

    {
        Name = local.mysql_role_name
    },
    local.common_tags
  )

}

