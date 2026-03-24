resource "aws_ssm_parameter" "frontend_alb_listener_arn" {
  name = "/${var.project}/${var.environment}/frontend_alb_listener_arn"
  type = "StringList"
  value = aws_lb_listener.https.arn
}
