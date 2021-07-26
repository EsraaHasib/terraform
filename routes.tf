##########################3 Route Tables ############################
##### PRIVATE  ROUTE TABLE #####
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.name_tag}-${var.environment}-private-rt"
  }
}


##### PUBLIC ROUTE TABLE #####

### Internet gateway ####
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.name_tag}-${var.environment}-gw"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
   route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "${var.name_tag}-${var.environment}-public1-rt"
  }
}

########### NAT GW ########
resource "aws_eip" "enatgateway" {
  vpc      = true
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.enatgateway.id
  subnet_id     = aws_subnet.public1.id

  tags = {
    Name = "${var.name_tag}-${var.environment}-natgw"
  }
}
resource "aws_route_table" "privatenat" {
  vpc_id = aws_vpc.main.id
   route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.id
  }
  tags = {
    Name = "${var.name_tag}-${var.environment}-public1-rt"
  }
}

####### NAT GW2 ############
resource "aws_eip" "enatgateway2" {
  vpc      = true
}

resource "aws_nat_gateway" "nat2" {
  allocation_id = aws_eip.enatgateway2.id
  subnet_id     = aws_subnet.public2.id

  tags = {
    Name = "${var.name_tag}-${var.environment}-vpc"
  }
}

resource "aws_route_table" "privatenat2" {
  vpc_id = aws_vpc.main.id
   route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat2.id
  }
  tags = {
    Name = "${var.name_tag}-${var.environment}-public2-rt"
  }
}

####### Subnet Association ##########
resource "aws_route_table_association" "pubic_subnet1_association" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "pubic_subnet2_association" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private_subnet1_association" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_subnet2_association" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_subnet3_association" {
  subnet_id      = aws_subnet.private3.id
  route_table_id = aws_route_table.privatenat.id
}

resource "aws_route_table_association" "private_subnet4_association" {
  subnet_id      = aws_subnet.private4.id
  route_table_id = aws_route_table.privatenat2.id
}