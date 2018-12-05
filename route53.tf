# This will fetch existing hosted zone, hosted zone has to be created already

data "aws_route53_zone" "jobassist" {
  name = "jobassist.com"
}

resource "aws_route53_record" "www" {
  zone_id = "${data.aws_route53_zone.jobassist.zone_id}"
  name    = "jobassist.com"
  type    = "A"

  alias {
    name                   = "${aws_elb.6pm_elb.dns_name}"
    zone_id                = "${aws_elb.6pm_elb.zone_id}"
    evaluate_target_health = false
  }
}
