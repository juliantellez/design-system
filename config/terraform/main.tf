terraform {
  backend "s3" {
    bucket  = "julian-tellez-tfstate"
    key     = "design-system"
    region  = "us-east-1"
    encrypt = true
    profile = "personal"
  }
}
