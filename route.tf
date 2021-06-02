resource "aws_route_table" "test_route" {
  vpc_id = "${aws_vpc.test_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.test_ig.id}"
  }
}

resource "aws_route_table_association" "test_public" {
  subnet_id      = "${aws_subnet.test_public_subnet.id}"
  route_table_id = "${aws_route_table.test_route.id}"
}
