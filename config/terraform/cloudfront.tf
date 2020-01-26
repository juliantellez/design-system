resource "aws_cloudfront_origin_access_identity" "bucket" {
  comment = "access_identity_${local.bucket_name}.s3.amazonaws.com"
}

resource "aws_cloudfront_distribution" "distribution" {
  origin {
    domain_name = "${aws_s3_bucket.bucket.bucket_regional_domain_name}"
    origin_id   = "${local.cloudfront_origin_id}"

    s3_origin_config {
      origin_access_identity = "${aws_cloudfront_origin_access_identity.bucket.cloudfront_access_identity_path}"
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "${local.cloudfront_origin_id}"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"

    min_ttl     = 0
    default_ttl = 0
    max_ttl     = 0
    compress    = true
  }

  tags = {
    application   = "${lookup(local.tags, "application")}"
    environment   = "${lookup(local.tags, "environment")}"
    gitRepo       = "${lookup(local.tags, "gitRepo")}"
    managedBy     = "${lookup(local.tags, "managedBy")}"
    WAFProtection = "${lookup(local.tags, "WAFProtection")}"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  aliases = ["${local.route53_domain_name}"]

  viewer_certificate {
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.1_2016"
    acm_certificate_arn      = "${local.acm_certificate_arn}"
  }
}
