resource "aws_route53_zone" "coffeetea_dev" {
  name = "coffeetea.dev"
}

resource "aws_route53_record" "henesys" {
  zone_id = aws_route53_zone.coffeetea_dev.zone_id
  name    = "henesys.coffeetea.dev"
  type    = "A"
  ttl     = 300
  records = ["14.52.209.201"]
}
