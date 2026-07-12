provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "Trend"
      Environment = "Dev"
      ManagedBy   = "Terraform"
    }
  }
}
