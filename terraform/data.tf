# Get current AWS account information
data "aws_caller_identity" "current" {}

# Get available Availability Zones
data "aws_availability_zones" "available" {}
