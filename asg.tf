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

  tag = {
    key                 = "env"
    value               = "${var.env}"
    propagate_at_launch = true
  }

  tag = {
    key                 = "dept"
    value               = "${var.dept}"
    propagate_at_launch = true
  }

  tag = {
    key                 = "created_by"
    value               = "${var.created_by}"
    propagate_at_launch = true
  }

  tag = {
    key                 = "KubernetesCluster"
    value               = "kukucluster.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "bastions.kukucluster.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "bastions"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/bastion"
    value               = "1"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_autoscaling_group" "master-eu-west-1a-masters-kukucluster-com" {
  name                 = "master-eu-west-1a.masters.kukucluster.com"
  launch_configuration = "${aws_launch_configuration.master-eu-west-1a-masters-kukucluster-com.id}"
  max_size             = "${var.master1a_max_size}"
  min_size             = "${var.master1a_min_size}"
  vpc_zone_identifier  = ["${aws_subnet.eu-west-1a-kukucluster-com.id}"]

  tag = {
    key                 = "env"
    value               = "${var.env}"
    propagate_at_launch = true
  }

  tag = {
    key                 = "dept"
    value               = "${var.dept}"
    propagate_at_launch = true
  }

  tag = {
    key                 = "created_by"
    value               = "${var.created_by}"
    propagate_at_launch = true
  }

  tag = {
    key                 = "KubernetesCluster"
    value               = "kukucluster.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-eu-west-1a.masters.kukucluster.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "master-eu-west-1a"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_autoscaling_group" "master-eu-west-1b-masters-kukucluster-com" {
  name                 = "master-eu-west-1b.masters.kukucluster.com"
  launch_configuration = "${aws_launch_configuration.master-eu-west-1b-masters-kukucluster-com.id}"
  max_size             = "${var.master1b_max_size}"
  min_size             = "${var.master1b_min_size}"
  vpc_zone_identifier  = ["${aws_subnet.eu-west-1b-kukucluster-com.id}"]

  tag = {
    key                 = "env"
    value               = "${var.env}"
    propagate_at_launch = true
  }

  tag = {
    key                 = "dept"
    value               = "${var.dept}"
    propagate_at_launch = true
  }

  tag = {
    key                 = "created_by"
    value               = "${var.created_by}"
    propagate_at_launch = true
  }

  tag = {
    key                 = "KubernetesCluster"
    value               = "kukucluster.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-eu-west-1b.masters.kukucluster.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "master-eu-west-1b"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_autoscaling_group" "master-eu-west-1c-masters-kukucluster-com" {
  name                 = "master-eu-west-1c.masters.kukucluster.com"
  launch_configuration = "${aws_launch_configuration.master-eu-west-1c-masters-kukucluster-com.id}"
  max_size             = "${var.master1c_max_size}"
  min_size             = "${var.master1c_min_size}"
  vpc_zone_identifier  = ["${aws_subnet.eu-west-1c-kukucluster-com.id}"]

  tag = {
    key                 = "env"
    value               = "${var.env}"
    propagate_at_launch = true
  }

  tag = {
    key                 = "dept"
    value               = "${var.dept}"
    propagate_at_launch = true
  }

  tag = {
    key                 = "created_by"
    value               = "${var.created_by}"
    propagate_at_launch = true
  }

  tag = {
    key                 = "KubernetesCluster"
    value               = "kukucluster.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-eu-west-1c.masters.kukucluster.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "master-eu-west-1c"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_autoscaling_group" "nodes-kukucluster-com" {
  name                 = "nodes.kukucluster.com"
  launch_configuration = "${aws_launch_configuration.nodes-kukucluster-com.id}"
  max_size             = "${var.node_max_size}"
  min_size             = "${var.node_min_size}"
  vpc_zone_identifier  = ["${aws_subnet.eu-west-1a-kukucluster-com.id}", "${aws_subnet.eu-west-1b-kukucluster-com.id}", "${aws_subnet.eu-west-1c-kukucluster-com.id}"]

  tag = {
    key                 = "env"
    value               = "${var.env}"
    propagate_at_launch = true
  }

  tag = {
    key                 = "dept"
    value               = "${var.dept}"
    propagate_at_launch = true
  }

  tag = {
    key                 = "created_by"
    value               = "${var.created_by}"
    propagate_at_launch = true
  }

  tag = {
    key                 = "KubernetesCluster"
    value               = "kukucluster.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "nodes.kukucluster.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "nodes"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/node"
    value               = "1"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}
