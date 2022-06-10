resource "aws_route_table" "route-wg" {
  vpc_id = aws_vpc.vpc-01.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-wg.id
  }

  tags = {
    Name = "route-wg"
  }
}
