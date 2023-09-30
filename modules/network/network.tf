resource "aws_vpc" "RAYMOND" {
  cidr_block       = var.vpc-cidr
  instance_tenancy = "default"

enable_dns_hostnames = true 
enable_dns_support = true 

  tags = {
    Name = "vpc-${var.name}" //RAYMOND
  }
}


resource "aws_subnet" "Raymond" {
  vpc_id                  = aws_vpc.RAYMOND.id
  cidr_block              = var.sbn-cidr //"10.0.11.0/24"
  map_public_ip_on_launch = true
  availability_zone       = var.azs


  tags = {
    Name = "sbn-${var.name}" //Raymond"
  }
}

resource "aws_internet_gateway" "ray_ig" {
  vpc_id = aws_vpc.RAYMOND.id

  tags = {
    Name = "${var.env}-${var.name}-ig" //raymond_ig"
  }
}

resource "aws_route_table" "ray_public_rt" {
  vpc_id = aws_vpc.RAYMOND.id


  tags = {
    Name = "${var.name}-rt" // raymond_public_rt"
  }
}


resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.ray_public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ray_ig.id

}


resource "aws_route_table_association" "ray_association" {
  subnet_id      = aws_subnet.Raymond.id
  route_table_id = aws_route_table.ray_public_rt.id
}
