# Webservers in public subnet

resource "aws_instance" "web" {
  count = 2

  #ami           = "${var.web_ami[var.region]}"
  ami                    = "${lookup(var.web_ami,var.region)}"
  instance_type          = "t2.micro"
  subnet_id              = "${local.web_sub_ids[count.index]}"
  vpc_security_group_ids = ["${aws_security_group.web-sg.id}"]
  user_data              = "${file("scripts/apache.sh")}"
  key_name               = "MyKey"
  iam_instance_profile   = "${aws_iam_instance_profile.test_profile.name}"

  tags {
    Name = "Web-${count.index}"
  }
}

# Configure security groups for webserver instances

resource "aws_security_group" "web-sg" {
  name        = "web-sg"
  description = "Allow ssh and http traffic"
  vpc_id      = "${aws_vpc.myapp.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
