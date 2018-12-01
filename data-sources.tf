# Returns list of availability zones
data "aws_availability_zones" "azs" {}

output "azs" {
  value = "${data.aws_availability_zones.azs.names}"
}
