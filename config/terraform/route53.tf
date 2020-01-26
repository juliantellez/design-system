resource "aws_route53_record" "route" {
  zone_id = "${local.route53_zone_id}"
  name    = "${local.route53_domain_name}"
  type    = "A"

  alias {
    name                   = "${aws_cloudfront_distribution.distribution.domain_name}"
    zone_id                = "${aws_cloudfront_distribution.distribution.hosted_zone_id}"
    evaluate_target_health = false
  }
}
