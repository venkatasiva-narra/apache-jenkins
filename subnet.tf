resource "aws_subnet" "test_public_subnet" {
  vpc_id            = "${aws_vpc.test_vpc.id}"
  cidr_block        = "192.168.0.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name = "test_public_subnet"
  }
}
