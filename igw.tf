resource "aws_internet_gateway" "igw-wg" {
  vpc_id = aws_vpc.vpc-01.id

  tags = {
    Name = "igw-wg"
  }
}