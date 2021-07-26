resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "${var.name_tag}-${var.environment}-vpc"
  }
}