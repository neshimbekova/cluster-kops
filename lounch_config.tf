resource "aws_launch_configuration" "bastions-kukucluster-com" {
  name_prefix                 = "bastions.kukucluster.com-"
  image_id                    = "${var.bastion_ami}"
  instance_type               = "${var.bastion_ins_type}"
  key_name                    = "${aws_key_pair.kubernetes-kukucluster-com-0dc4429ad65207534614a40e7a9af6cd.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.bastions-kukucluster-com.id}"
  security_groups             = ["${aws_security_group.bastion-kukucluster-com.id}"]
  associate_public_ip_address = true

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 32
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_launch_configuration" "master-eu-west-1a-masters-kukucluster-com" {
  name_prefix                 = "master-eu-west-1a.masters.kukucluster.com-"
  image_id                    = "${var.master1a_ami}"
  instance_type               = "${var.master1a_ins_type}"
  key_name                    = "${aws_key_pair.kubernetes-kukucluster-com-0dc4429ad65207534614a40e7a9af6cd.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-kukucluster-com.id}"
  security_groups             = ["${aws_security_group.masters-kukucluster-com.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-eu-west-1a.masters.kukucluster.com_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 64
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_launch_configuration" "master-eu-west-1b-masters-kukucluster-com" {
  name_prefix                 = "master-eu-west-1b.masters.kukucluster.com-"
  image_id                    = "${var.master1b_ami}"
  instance_type               = "${var.master1b_ins_type}"
  key_name                    = "${aws_key_pair.kubernetes-kukucluster-com-0dc4429ad65207534614a40e7a9af6cd.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-kukucluster-com.id}"
  security_groups             = ["${aws_security_group.masters-kukucluster-com.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-eu-west-1b.masters.kukucluster.com_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 64
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_launch_configuration" "master-eu-west-1c-masters-kukucluster-com" {
  name_prefix                 = "master-eu-west-1c.masters.kukucluster.com-"
  image_id                    = "${var.master1c_ami}"
  instance_type               = "${var.master1c_ins_type}"
  key_name                    = "${aws_key_pair.kubernetes-kukucluster-com-0dc4429ad65207534614a40e7a9af6cd.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-kukucluster-com.id}"
  security_groups             = ["${aws_security_group.masters-kukucluster-com.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-eu-west-1c.masters.kukucluster.com_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 64
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_launch_configuration" "nodes-kukucluster-com" {
  name_prefix                 = "nodes.kukucluster.com-"
  image_id                    = "${var.node_ami}"
  instance_type               = "${var.node_instance_type}"
  key_name                    = "${aws_key_pair.kubernetes-kukucluster-com-0dc4429ad65207534614a40e7a9af6cd.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.nodes-kukucluster-com.id}"
  security_groups             = ["${aws_security_group.nodes-kukucluster-com.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_nodes.kukucluster.com_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 128
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}
