resource "aws_route" "0-0-0-0--0" {
  route_table_id         = "${aws_route_table.kukucluster-com.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.kukucluster-com.id}"
}

resource "aws_route" "private-eu-west-1a-0-0-0-0--0" {
  route_table_id         = "${aws_route_table.private-eu-west-1a-kukucluster-com.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.eu-west-1a-kukucluster-com.id}"
}

resource "aws_route" "private-eu-west-1b-0-0-0-0--0" {
  route_table_id         = "${aws_route_table.private-eu-west-1b-kukucluster-com.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.eu-west-1b-kukucluster-com.id}"
}

resource "aws_route" "private-eu-west-1c-0-0-0-0--0" {
  route_table_id         = "${aws_route_table.private-eu-west-1c-kukucluster-com.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.eu-west-1c-kukucluster-com.id}"
}

resource "aws_route53_record" "api-kukucluster-com" {
  name = "api.kukucluster.com"
  type = "A"

  alias = {
    name                   = "${aws_elb.api-kukucluster-com.dns_name}"
    zone_id                = "${aws_elb.api-kukucluster-com.zone_id}"
    evaluate_target_health = false
  }

  zone_id = "/hostedzone/Z2MHY5D8UP3NDJ"
}

resource "aws_route53_record" "bastion-kukucluster-com" {
  name = "bastion.kukucluster.com"
  type = "A"

  alias = {
    name                   = "${aws_elb.bastion-kukucluster-com.dns_name}"
    zone_id                = "${aws_elb.bastion-kukucluster-com.zone_id}"
    evaluate_target_health = false
  }

  zone_id = "/hostedzone/Z2MHY5D8UP3NDJ"
}

resource "aws_route53_zone_association" "Z2MHY5D8UP3NDJ" {
  zone_id = "/hostedzone/Z2MHY5D8UP3NDJ"
  vpc_id  = "${aws_vpc.kukucluster-com.id}"
}
