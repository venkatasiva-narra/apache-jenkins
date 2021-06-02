
resource "aws_internet_gateway" "test_ig" {
  vpc_id = "${aws_vpc.test_vpc.id}"

  tags = {
    Name = "test_ig"
  }
}
