resource "aws_route53_record" "www" {
  for_each = aws_instance.roboshop  #forloop
  zone_id = var.zone_id
  name    = "${each.key}.${var.domain_name}" #mongodb.narendaws-84s.site
  type    = "A"
  ttl     = 1
  records = [each.value.private_ip]
}