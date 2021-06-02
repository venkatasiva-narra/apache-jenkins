resource "aws_subnet" "test_public_subnet" {
  vpc_id            = aws_vpc.test_vpc.id
  cidr_block        = "192.168.0.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name = "test_public_subnet"
  }
}

resource "aws_subnet" "test_public_subnet_1" {
  vpc_id            = aws_vpc.test_vpc.id
  cidr_block        = "192.168.2.0/24"
  availability_zone = "us-west-2b"

  tags = {
    Name = "test_public_subnet_1"
  }
}
