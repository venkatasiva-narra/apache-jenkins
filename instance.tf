resource "aws_instance" "test_instance" {
    ami               = "ami-0cf6f5c8a62fa5da6"
    instance_type     = "t2.micro"
    availability_zone = "us-east-2a"
    associate_public_ip_address = true
    subnet_id         = "${aws_subnet.test_public_subnet.id}"
    vpc_security_group_ids  = ["${aws_security_group.test_security.id}"]
    key_name          = "apache-webserver"
    user_data         = file("./apache.sh")

    tags = {
        Name = "test_instance"
    }
}
