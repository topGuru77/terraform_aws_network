resource "aws_vpc" "terraformvpc" {
  cidr_block = var.vpc_cidr_block
  instance_tenancy = var.vpc_instance_tenancy 
  tags = var.tag_overlay
}

# creating the IGW
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.terraformvpc.id
  tags = var.tag_overlay
}


resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.terraformvpc.id
  cidr_block = var.pubsubnet_cidr_block 
  
  tags = {
    Name = "Public_Subnet" 
  }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.terraformvpc.id
  cidr_block = var.privsubnet_cidr_block 
  
  tags = {
    Name = "Private_Subnet" 
  }
}

# creating the route table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.terraformvpc.id

  route {
    cidr_block = var.pubrt_cidrblock
    gateway_id = aws_internet_gateway.gw.id
  }


  tags = {
    Name = "PubSNRT"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.terraformvpc.id

  route {
    cidr_block = var.privrt_cidrblock
    gateway_id = aws_internet_gateway.gw.id
  }


  tags = {
    Name = "PrivSNRT"
  }
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "NATGW"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw, aws_eip.eip]
}

resource "aws_eip" "eip" {  
}

resource "aws_route_table_association" "pubRT" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "privRT" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private_rt.id
}


