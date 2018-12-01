# Create VPC
resource "aws_vpc" "myapp" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "${var.vpc_tenancy}"

  tags {
    Name = "myapp_vpc"
  }
}

# Add public subnets, make sure each zone has one subnet
resource "aws_subnet" "webservers" {
  count      = "${length(data.aws_availability_zones.azs.names)}"
  vpc_id     = "${aws_vpc.myapp.id}"
  cidr_block = "10.0.1.0/24"

  tags {
    Name = "Main"
  }
}
