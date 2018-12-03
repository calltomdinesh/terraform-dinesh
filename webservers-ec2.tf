resource "aws_instance" "web" {
  count = 2

  #ami           = "${var.web_ami[var.region]}"
  ami                    = "${lookup(var.web_ami,var.region)}"
  instance_type          = "t2.micro"
  subnet_id              = "${local.web_sub_ids[count.index]}"
  vpc_security_group_ids = ""

  tags {
    Name = "Web-${count.index}"
  }
}
