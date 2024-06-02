output "security_group_id" {
  value = aws_instance.web.security_group_ids[0]
}
