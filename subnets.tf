resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "${var.name_tag}-${var.environment}-vpc"
  }
}

resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.2.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "${var.name_tag}-${var.environment}-vpc"
  }
}

resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.3.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "${var.name_tag}-${var.environment}-vpc"
  }
}

resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.4.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "${var.name_tag}-${var.environment}-vpc"
  }
}


resource "aws_subnet" "private3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.5.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "${var.name_tag}-${var.environment}-vpc"
  }
}

resource "aws_subnet" "private4" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.6.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "${var.name_tag}-${var.environment}-vpc"
  }
}