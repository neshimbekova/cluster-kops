resource "aws_iam_instance_profile" "bastions-kukucluster-com" {
  name = "bastions.kukucluster.com"
  role = "${aws_iam_role.bastions-kukucluster-com.name}"
}

resource "aws_iam_instance_profile" "masters-kukucluster-com" {
  name = "masters.kukucluster.com"
  role = "${aws_iam_role.masters-kukucluster-com.name}"
}

resource "aws_iam_instance_profile" "nodes-kukucluster-com" {
  name = "nodes.kukucluster.com"
  role = "${aws_iam_role.nodes-kukucluster-com.name}"
}

resource "aws_iam_role" "bastions-kukucluster-com" {
  name               = "bastions.kukucluster.com"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_bastions.kukucluster.com_policy")}"
}

resource "aws_iam_role" "masters-kukucluster-com" {
  name               = "masters.kukucluster.com"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_masters.kukucluster.com_policy")}"
}

resource "aws_iam_role" "nodes-kukucluster-com" {
  name               = "nodes.kukucluster.com"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_nodes.kukucluster.com_policy")}"
}

resource "aws_iam_role_policy" "bastions-kukucluster-com" {
  name   = "bastions.kukucluster.com"
  role   = "${aws_iam_role.bastions-kukucluster-com.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_bastions.kukucluster.com_policy")}"
}

resource "aws_iam_role_policy" "masters-kukucluster-com" {
  name   = "masters.kukucluster.com"
  role   = "${aws_iam_role.masters-kukucluster-com.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_masters.kukucluster.com_policy")}"
}

resource "aws_iam_role_policy" "nodes-kukucluster-com" {
  name   = "nodes.kukucluster.com"
  role   = "${aws_iam_role.nodes-kukucluster-com.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_nodes.kukucluster.com_policy")}"
}
