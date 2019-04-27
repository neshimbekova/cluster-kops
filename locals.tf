locals = {
  bastion_autoscaling_group_ids     = ["${aws_autoscaling_group.bastions-kukucluster-com.id}"]
  bastion_security_group_ids        = ["${aws_security_group.bastion-kukucluster-com.id}"]
  bastions_role_arn                 = "${aws_iam_role.bastions-kukucluster-com.arn}"
  bastions_role_name                = "${aws_iam_role.bastions-kukucluster-com.name}"
  cluster_name                      = "kukucluster.com"
  master_autoscaling_group_ids      = ["${aws_autoscaling_group.master-eu-west-1a-masters-kukucluster-com.id}", "${aws_autoscaling_group.master-eu-west-1b-masters-kukucluster-com.id}", "${aws_autoscaling_group.master-eu-west-1c-masters-kukucluster-com.id}"]
  master_security_group_ids         = ["${aws_security_group.masters-kukucluster-com.id}"]
  masters_role_arn                  = "${aws_iam_role.masters-kukucluster-com.arn}"
  masters_role_name                 = "${aws_iam_role.masters-kukucluster-com.name}"
  node_autoscaling_group_ids        = ["${aws_autoscaling_group.nodes-kukucluster-com.id}"]
  node_security_group_ids           = ["${aws_security_group.nodes-kukucluster-com.id}"]
  node_subnet_ids                   = ["${aws_subnet.eu-west-1a-kukucluster-com.id}", "${aws_subnet.eu-west-1b-kukucluster-com.id}", "${aws_subnet.eu-west-1c-kukucluster-com.id}"]
  nodes_role_arn                    = "${aws_iam_role.nodes-kukucluster-com.arn}"
  nodes_role_name                   = "${aws_iam_role.nodes-kukucluster-com.name}"
  region                            = "eu-west-1"
  route_table_private-eu-west-1a_id = "${aws_route_table.private-eu-west-1a-kukucluster-com.id}"
  route_table_private-eu-west-1b_id = "${aws_route_table.private-eu-west-1b-kukucluster-com.id}"
  route_table_private-eu-west-1c_id = "${aws_route_table.private-eu-west-1c-kukucluster-com.id}"
  route_table_public_id             = "${aws_route_table.kukucluster-com.id}"
  subnet_eu-west-1a_id              = "${aws_subnet.eu-west-1a-kukucluster-com.id}"
  subnet_eu-west-1b_id              = "${aws_subnet.eu-west-1b-kukucluster-com.id}"
  subnet_eu-west-1c_id              = "${aws_subnet.eu-west-1c-kukucluster-com.id}"
  subnet_utility-eu-west-1a_id      = "${aws_subnet.utility-eu-west-1a-kukucluster-com.id}"
  subnet_utility-eu-west-1b_id      = "${aws_subnet.utility-eu-west-1b-kukucluster-com.id}"
  subnet_utility-eu-west-1c_id      = "${aws_subnet.utility-eu-west-1c-kukucluster-com.id}"
  vpc_cidr_block                    = "${aws_vpc.kukucluster-com.cidr_block}"
  vpc_id                            = "${aws_vpc.kukucluster-com.id}"
}

output "bastion_autoscaling_group_ids" {
  value = ["${aws_autoscaling_group.bastions-kukucluster-com.id}"]
}

output "bastion_security_group_ids" {
  value = ["${aws_security_group.bastion-kukucluster-com.id}"]
}

output "bastions_role_arn" {
  value = "${aws_iam_role.bastions-kukucluster-com.arn}"
}

output "bastions_role_name" {
  value = "${aws_iam_role.bastions-kukucluster-com.name}"
}

output "cluster_name" {
  value = "kukucluster.com"
}

output "master_autoscaling_group_ids" {
  value = ["${aws_autoscaling_group.master-eu-west-1a-masters-kukucluster-com.id}", "${aws_autoscaling_group.master-eu-west-1b-masters-kukucluster-com.id}", "${aws_autoscaling_group.master-eu-west-1c-masters-kukucluster-com.id}"]
}

output "master_security_group_ids" {
  value = ["${aws_security_group.masters-kukucluster-com.id}"]
}

output "masters_role_arn" {
  value = "${aws_iam_role.masters-kukucluster-com.arn}"
}

output "masters_role_name" {
  value = "${aws_iam_role.masters-kukucluster-com.name}"
}

output "node_autoscaling_group_ids" {
  value = ["${aws_autoscaling_group.nodes-kukucluster-com.id}"]
}

output "node_security_group_ids" {
  value = ["${aws_security_group.nodes-kukucluster-com.id}"]
}

output "node_subnet_ids" {
  value = ["${aws_subnet.eu-west-1a-kukucluster-com.id}", "${aws_subnet.eu-west-1b-kukucluster-com.id}", "${aws_subnet.eu-west-1c-kukucluster-com.id}"]
}

output "nodes_role_arn" {
  value = "${aws_iam_role.nodes-kukucluster-com.arn}"
}

output "nodes_role_name" {
  value = "${aws_iam_role.nodes-kukucluster-com.name}"
}

output "region" {
  value = "eu-west-1"
}

output "route_table_private-eu-west-1a_id" {
  value = "${aws_route_table.private-eu-west-1a-kukucluster-com.id}"
}

output "route_table_private-eu-west-1b_id" {
  value = "${aws_route_table.private-eu-west-1b-kukucluster-com.id}"
}

output "route_table_private-eu-west-1c_id" {
  value = "${aws_route_table.private-eu-west-1c-kukucluster-com.id}"
}

output "route_table_public_id" {
  value = "${aws_route_table.kukucluster-com.id}"
}

output "subnet_eu-west-1a_id" {
  value = "${aws_subnet.eu-west-1a-kukucluster-com.id}"
}

output "subnet_eu-west-1b_id" {
  value = "${aws_subnet.eu-west-1b-kukucluster-com.id}"
}

output "subnet_eu-west-1c_id" {
  value = "${aws_subnet.eu-west-1c-kukucluster-com.id}"
}

output "subnet_utility-eu-west-1a_id" {
  value = "${aws_subnet.utility-eu-west-1a-kukucluster-com.id}"
}

output "subnet_utility-eu-west-1b_id" {
  value = "${aws_subnet.utility-eu-west-1b-kukucluster-com.id}"
}

output "subnet_utility-eu-west-1c_id" {
  value = "${aws_subnet.utility-eu-west-1c-kukucluster-com.id}"
}

output "vpc_cidr_block" {
  value = "${aws_vpc.kukucluster-com.cidr_block}"
}

output "vpc_id" {
  value = "${aws_vpc.kukucluster-com.id}"
}
