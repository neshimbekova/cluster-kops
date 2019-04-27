resource "aws_autoscaling_attachment" "bastions-kukucluster-com" {
  elb                    = "${aws_elb.bastion-kukucluster-com.id}"
  autoscaling_group_name = "${aws_autoscaling_group.bastions-kukucluster-com.id}"
}

resource "aws_autoscaling_attachment" "master-eu-west-1a-masters-kukucluster-com" {
  elb                    = "${aws_elb.api-kukucluster-com.id}"
  autoscaling_group_name = "${aws_autoscaling_group.master-eu-west-1a-masters-kukucluster-com.id}"
}

resource "aws_autoscaling_attachment" "master-eu-west-1b-masters-kukucluster-com" {
  elb                    = "${aws_elb.api-kukucluster-com.id}"
  autoscaling_group_name = "${aws_autoscaling_group.master-eu-west-1b-masters-kukucluster-com.id}"
}

resource "aws_autoscaling_attachment" "master-eu-west-1c-masters-kukucluster-com" {
  elb                    = "${aws_elb.api-kukucluster-com.id}"
  autoscaling_group_name = "${aws_autoscaling_group.master-eu-west-1c-masters-kukucluster-com.id}"
}

resource "aws_autoscaling_group" "bastions-kukucluster-com" {
  name                 = "bastions.kukucluster.com"
  launch_configuration = "${aws_launch_configuration.bastions-kukucluster-com.id}"
  max_size             = "${var.bastion_max_size}"
  min_size             = "${var.bastion_min_size}"
  vpc_zone_identifier  = ["${aws_subnet.utility-eu-west-1a-kukucluster-com.id}", "${aws_subnet.utility-eu-west-1b-kukucluster-com.id}", "${aws_subnet.utility-eu-west-1c-kukucluster-com.id}"]
  enabled_metrics      = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  metrics_granularity  = "1Minute"

  tags {
    "KubernetesCluster "                                                      = "kukucluster.com"
    "Name"                                                                    = "bastions.kukucluster.com"
    "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup" = "bastions"
    "k8s.io/role/bastion"                                                     = "1"
    propagate_at_launch                                                       = true
    env                                                                       = "${var.env}"
    dept                                                                      = "${var.dept}"
    created_by                                                                = "${var.created_by}"
  }
}

resource "aws_autoscaling_group" "master-eu-west-1a-masters-kukucluster-com" {
  name                 = "master-eu-west-1a.masters.kukucluster.com"
  launch_configuration = "${aws_launch_configuration.master-eu-west-1a-masters-kukucluster-com.id}"
  max_size             = "${var.master1a_max_size}"
  min_size             = "${var.master1a_min_size}"
  vpc_zone_identifier  = ["${aws_subnet.eu-west-1a-kukucluster-com.id}"]
  metrics_granularity  = "1Minute"
  enabled_metrics      = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]

  tags {
    "KubernetesCluster"                                                       = "kukucluster.com"
    "Name"                                                                    = "master-eu-west-1a.masters.kukucluster.com"
    "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup" = "master-eu-west-1a"
    "k8s.io/role/master"                                                      = "1"
    propagate_at_launch                                                       = true
    env                                                                       = "${var.env}"
    dept                                                                      = "${var.dept}"
    created_by                                                                = "${var.created_by}"
  }
}

resource "aws_autoscaling_group" "master-eu-west-1b-masters-kukucluster-com" {
  name                 = "master-eu-west-1b.masters.kukucluster.com"
  launch_configuration = "${aws_launch_configuration.master-eu-west-1b-masters-kukucluster-com.id}"
  max_size             = "${var.master1b_max_size}"
  min_size             = "${var.master1b_min_size}"
  vpc_zone_identifier  = ["${aws_subnet.eu-west-1b-kukucluster-com.id}"]
  metrics_granularity  = "1Minute"
  enabled_metrics      = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]

  tags {
    "KubernetesCluster"                                                       = "kukucluster.com"
    "Name"                                                                    = "master-eu-west-1b.masters.kukucluster.com"
    "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup" = "master-eu-west-1b"
    "k8s.io/role/master"                                                      = "1"
    propagate_at_launch                                                       = true
    env                                                                       = "${var.env}"
    dept                                                                      = "${var.dept}"
    created_by                                                                = "${var.created_by}"
  }
}

resource "aws_autoscaling_group" "master-eu-west-1c-masters-kukucluster-com" {
  name                 = "master-eu-west-1c.masters.kukucluster.com"
  launch_configuration = "${aws_launch_configuration.master-eu-west-1c-masters-kukucluster-com.id}"
  max_size             = "${var.master1c_max_size}"
  min_size             = "${var.master1c_min_size}"
  vpc_zone_identifier  = ["${aws_subnet.eu-west-1c-kukucluster-com.id}"]
  metrics_granularity  = "1Minute"
  enabled_metrics      = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]

  tags {
    "KubernetesCluster"                                                       = "kukucluster.com"
    "Name"                                                                    = "master-eu-west-1c.masters.kukucluster.com"
    "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup" = "master-eu-west-1c"
    "k8s.io/role/master"                                                      = "1"
    propagate_at_launch                                                       = true
    env                                                                       = "${var.env}"
    dept                                                                      = "${var.dept}"
    created_by                                                                = "${var.created_by}"
  }
}

resource "aws_autoscaling_group" "nodes-kukucluster-com" {
  name                 = "nodes.kukucluster.com"
  launch_configuration = "${aws_launch_configuration.nodes-kukucluster-com.id}"
  max_size             = "${var.node_max_size}"
  min_size             = "${var.node_min_size}"
  vpc_zone_identifier  = ["${aws_subnet.eu-west-1a-kukucluster-com.id}", "${aws_subnet.eu-west-1b-kukucluster-com.id}", "${aws_subnet.eu-west-1c-kukucluster-com.id}"]
  metrics_granularity  = "1Minute"
  enabled_metrics      = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]

  tags {
    "KubernetesCluster"                                                       = "kukucluster.com"
    "Name"                                                                    = "nodes.kukucluster.com"
    "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup" = "nodes"
    "k8s.io/role/node"                                                        = "1"
    propagate_at_launch                                                       = true
    env                                                                       = "${var.env}"
    dept                                                                      = "${var.dept}"
    created_by                                                                = "${var.created_by}"
  }
}
