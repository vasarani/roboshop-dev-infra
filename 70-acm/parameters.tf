resource "aws_ssm_parameter" "frontend_alb_certificate_arn" {
    name = "/${var.project}/${var.environment}/frontend_alb_certificate_arn"
    type = "StringList"
    value = aws_acm_certificate.roboshop.arn 
}