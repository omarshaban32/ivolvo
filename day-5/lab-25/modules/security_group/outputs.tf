output "security_group_ids" {
  value = [aws_security_group.web.id, aws_security_group.db.id]
}

