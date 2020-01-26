data "aws_iam_policy_document" "bucket" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.bucket.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = ["${aws_cloudfront_origin_access_identity.bucket.iam_arn}"]
    }
  }
}

resource "aws_s3_bucket_policy" "bucket" {
  bucket = "${aws_s3_bucket.bucket.id}"
  policy = "${data.aws_iam_policy_document.bucket.json}"
}

resource "aws_s3_bucket" "bucket" {
  acl    = "private"
  bucket = "${local.bucket_name}"

  tags = {
    application = "${lookup(local.tags, "application")}"
    environment = "${lookup(local.tags, "environment")}"
    gitRepo     = "${lookup(local.tags, "gitRepo")}"
    managedBy   = "${lookup(local.tags, "managedBy")}"
  }
}
