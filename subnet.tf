resource "aws_subnet" "my_subnet" {
  vpc_id     = aws_vpc.vpc-01.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Main"
  }
}