resource "aws_ebs_volume" "a-etcd-events-kukucluster-com" {
  availability_zone = "eu-west-1a"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                       = "kukucluster.com"
    Name                                    = "a.etcd-events.kukucluster.com"
    "k8s.io/etcd/events"                    = "a/a,b,c"
    "k8s.io/role/master"                    = "1"
    "kubernetes.io/cluster/kukucluster.com" = "owned"
  }
}

resource "aws_ebs_volume" "a-etcd-main-kukucluster-com" {
  availability_zone = "eu-west-1a"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                       = "kukucluster.com"
    Name                                    = "a.etcd-main.kukucluster.com"
    "k8s.io/etcd/main"                      = "a/a,b,c"
    "k8s.io/role/master"                    = "1"
    "kubernetes.io/cluster/kukucluster.com" = "owned"
  }
}

resource "aws_ebs_volume" "b-etcd-events-kukucluster-com" {
  availability_zone = "eu-west-1b"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                       = "kukucluster.com"
    Name                                    = "b.etcd-events.kukucluster.com"
    "k8s.io/etcd/events"                    = "b/a,b,c"
    "k8s.io/role/master"                    = "1"
    "kubernetes.io/cluster/kukucluster.com" = "owned"
  }
}

resource "aws_ebs_volume" "b-etcd-main-kukucluster-com" {
  availability_zone = "eu-west-1b"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                       = "kukucluster.com"
    Name                                    = "b.etcd-main.kukucluster.com"
    "k8s.io/etcd/main"                      = "b/a,b,c"
    "k8s.io/role/master"                    = "1"
    "kubernetes.io/cluster/kukucluster.com" = "owned"
  }
}

resource "aws_ebs_volume" "c-etcd-events-kukucluster-com" {
  availability_zone = "eu-west-1c"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                       = "kukucluster.com"
    Name                                    = "c.etcd-events.kukucluster.com"
    "k8s.io/etcd/events"                    = "c/a,b,c"
    "k8s.io/role/master"                    = "1"
    "kubernetes.io/cluster/kukucluster.com" = "owned"
  }
}

resource "aws_ebs_volume" "c-etcd-main-kukucluster-com" {
  availability_zone = "eu-west-1c"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                       = "kukucluster.com"
    Name                                    = "c.etcd-main.kukucluster.com"
    "k8s.io/etcd/main"                      = "c/a,b,c"
    "k8s.io/role/master"                    = "1"
    "kubernetes.io/cluster/kukucluster.com" = "owned"
  }
}

resource "aws_elb" "api-kukucluster-com" {
  name = "api-kukucluster-com-gakhql"

  listener = {
    instance_port     = 443
    instance_protocol = "TCP"
    lb_port           = 443
    lb_protocol       = "TCP"
  }

  security_groups = ["${aws_security_group.api-elb-kukucluster-com.id}"]
  subnets         = ["${aws_subnet.utility-eu-west-1a-kukucluster-com.id}", "${aws_subnet.utility-eu-west-1b-kukucluster-com.id}", "${aws_subnet.utility-eu-west-1c-kukucluster-com.id}"]

  health_check = {
    target              = "SSL:443"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 10
    timeout             = 5
  }

  idle_timeout = 300

  tags = {
    KubernetesCluster = "kukucluster.com"
    Name              = "api.kukucluster.com"
  }
}

resource "aws_elb" "bastion-kukucluster-com" {
  name = "bastion-kukucluster-com-fla7ib"

  listener = {
    instance_port     = 22
    instance_protocol = "TCP"
    lb_port           = 22
    lb_protocol       = "TCP"
  }

  security_groups = ["${aws_security_group.bastion-elb-kukucluster-com.id}"]
  subnets         = ["${aws_subnet.utility-eu-west-1a-kukucluster-com.id}", "${aws_subnet.utility-eu-west-1b-kukucluster-com.id}", "${aws_subnet.utility-eu-west-1c-kukucluster-com.id}"]

  health_check = {
    target              = "TCP:22"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 10
    timeout             = 5
  }

  idle_timeout = 300

  tags = {
    KubernetesCluster = "kukucluster.com"
    Name              = "bastion.kukucluster.com"
  }
}
