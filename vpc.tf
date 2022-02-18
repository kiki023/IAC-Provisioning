#
# VPC Resources
#  * VPC
#  * Subnets
#  * Internet Gateway
#  * Route Table
#

resource "aws_vpc" "dotpay-staging" {
  cidr_block = "10.0.0.0/16"

  tags = tomap({
    "Name" = "dotpay-staging-node",
    "kubernetes.io/cluster/${var.cluster-name}" = "shared",
  })
}
data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "dotpay" {
  count = 2

  availability_zone       = data.aws_availability_zones.available.names[count.index]
  cidr_block              = "10.0.${count.index}.0/24"
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.dotpay-staging.id

  tags = tomap({
    "Name" = "dotpay-staging-node",
    "kubernetes.io/cluster/${var.cluster-name}" = "shared",
  })
}

resource "aws_internet_gateway" "dp" {
  vpc_id = aws_vpc.dotpay-staging.id

  tags = {
    Name = "dotpay-staging"
  }
}

resource "aws_route_table" "demo" {
  vpc_id = aws_vpc.dotpay-staging.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demo.id
  }
}

resource "aws_route_table_association" "demo" {
  count = 2

  subnet_id      = aws_subnet.demo.*.id[count.index]
  route_table_id = aws_route_table.demo.id
}
