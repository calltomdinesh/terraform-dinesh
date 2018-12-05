# Group of private subnets to Launch RDS

resource "aws_db_subnet_group" "rds_subnets" {
  name = "rds_subnets"

  #subnet_ids = ["${aws_subnet.rds.*.id}"]
  subnet_ids = ["${aws_subnet.rds1.id}", "${aws_subnet.rds2.id}"]

  tags {
    Name = "Subnet group for RDS"
  }
}

# Launch RDS

resource "aws_db_instance" "default" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "dineshdb"
  username             = "dineshdb"
  password             = "dineshdb"
  parameter_group_name = "default.mysql5.7"
  db_subnet_group_name = "${aws_db_subnet_group.rds_subnets.id}"
}
