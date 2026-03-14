resource "aws_ssm_parameter" "backend_alb_listener_arn" {
  name = "/${var.project}/${var.environment}/backend_alb_listener_arn"
  type = "string"
  value = aws_lb_listener.http.arn
}