output "security_group_id" {
  value = aws_db_instance.default.vpc_security_group_ids[0]
}
