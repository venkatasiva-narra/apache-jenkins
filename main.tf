


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


resource "aws_security_group" "test_security" {
    name = "test_security"
    vpc_id ="${aws_vpc.test_vpc.id}"
    ingress {
        from_port = 22
        to_port   = 22
        protocol  = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 80
        to_port   = 80
        protocol  = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port   = 0
        protocol  = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "test_instance" {
    ami               = "ami-0cf6f5c8a62fa5da6"
    instance_type     = "t2.micro"
    availability_zone = "us-west-2a"
    subnet_id         = "${aws_subnet.test_public_subnet.id}"
    security_groups   = ["${aws_security_group.test_security.name}"]
    key_name          = "apache-webserver"

    tags = {
        Name = "test_instance"
    }
}
