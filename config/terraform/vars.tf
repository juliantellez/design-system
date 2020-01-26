variable "aws_account" {
  default     = "personal"
  description = "personal account"
}

variable "aws_region" {
  default = "us-east-1"
}

variable "environment" {
  default = "production"
}

# SSL Certificate for *.juliantellez.com
# use aws acm list-certificates --region us-east-1
variable "acm_certificate_arn" {
    default = "unset"
}
