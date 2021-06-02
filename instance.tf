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
