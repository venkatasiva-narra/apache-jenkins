resource "aws_vpc" "test_vpc" {
  cidr_block       = "192.168.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "test_vpc"
  }
}
