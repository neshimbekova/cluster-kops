resource "aws_security_group" "api-elb-kukucluster-com" {
  name        = "api-elb.kukucluster.com"
  vpc_id      = "${aws_vpc.kukucluster-com.id}"
  description = "Security group for api ELB"

  tags = {
    KubernetesCluster                       = "kukucluster.com"
    Name                                    = "api-elb.kukucluster.com"
    "kubernetes.io/cluster/kukucluster.com" = "owned"
  }
}

resource "aws_security_group" "bastion-elb-kukucluster-com" {
  name        = "bastion-elb.kukucluster.com"
  vpc_id      = "${aws_vpc.kukucluster-com.id}"
  description = "Security group for bastion ELB"

  tags = {
    KubernetesCluster                       = "kukucluster.com"
    Name                                    = "bastion-elb.kukucluster.com"
    "kubernetes.io/cluster/kukucluster.com" = "owned"
  }
}

resource "aws_security_group" "bastion-kukucluster-com" {
  name        = "bastion.kukucluster.com"
  vpc_id      = "${aws_vpc.kukucluster-com.id}"
  description = "Security group for bastion"

  tags = {
    KubernetesCluster                       = "kukucluster.com"
    Name                                    = "bastion.kukucluster.com"
    "kubernetes.io/cluster/kukucluster.com" = "owned"
  }
}

resource "aws_security_group" "masters-kukucluster-com" {
  name        = "masters.kukucluster.com"
  vpc_id      = "${aws_vpc.kukucluster-com.id}"
  description = "Security group for masters"

  tags = {
    KubernetesCluster                       = "kukucluster.com"
    Name                                    = "masters.kukucluster.com"
    "kubernetes.io/cluster/kukucluster.com" = "owned"
  }
}

resource "aws_security_group" "nodes-kukucluster-com" {
  name        = "nodes.kukucluster.com"
  vpc_id      = "${aws_vpc.kukucluster-com.id}"
  description = "Security group for nodes"

  tags = {
    KubernetesCluster                       = "kukucluster.com"
    Name                                    = "nodes.kukucluster.com"
    "kubernetes.io/cluster/kukucluster.com" = "owned"
  }
}

resource "aws_security_group_rule" "all-master-to-master" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-kukucluster-com.id}"
  source_security_group_id = "${aws_security_group.masters-kukucluster-com.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "all-master-to-node" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-kukucluster-com.id}"
  source_security_group_id = "${aws_security_group.masters-kukucluster-com.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "all-node-to-node" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-kukucluster-com.id}"
  source_security_group_id = "${aws_security_group.nodes-kukucluster-com.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "api-elb-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.api-elb-kukucluster-com.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "bastion-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.bastion-kukucluster-com.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "bastion-elb-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.bastion-elb-kukucluster-com.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "bastion-to-master-ssh" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-kukucluster-com.id}"
  source_security_group_id = "${aws_security_group.bastion-kukucluster-com.id}"
  from_port                = "${var.from_port}"
  to_port                  = "${var.to_port}"
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "bastion-to-node-ssh" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-kukucluster-com.id}"
  source_security_group_id = "${aws_security_group.bastion-kukucluster-com.id}"
  from_port                = "${var.from_port}"
  to_port                  = "${var.to_port}"
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "https-api-elb-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.api-elb-kukucluster-com.id}"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "https-elb-to-master" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-kukucluster-com.id}"
  source_security_group_id = "${aws_security_group.api-elb-kukucluster-com.id}"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "master-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.masters-kukucluster-com.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "node-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.nodes-kukucluster-com.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "node-to-master-tcp-1-2379" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-kukucluster-com.id}"
  source_security_group_id = "${aws_security_group.nodes-kukucluster-com.id}"
  from_port                = 1
  to_port                  = 2379
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-tcp-2382-4000" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-kukucluster-com.id}"
  source_security_group_id = "${aws_security_group.nodes-kukucluster-com.id}"
  from_port                = 2382
  to_port                  = 4000
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-tcp-4003-65535" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-kukucluster-com.id}"
  source_security_group_id = "${aws_security_group.nodes-kukucluster-com.id}"
  from_port                = 4003
  to_port                  = 65535
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-udp-1-65535" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-kukucluster-com.id}"
  source_security_group_id = "${aws_security_group.nodes-kukucluster-com.id}"
  from_port                = 1
  to_port                  = 65535
  protocol                 = "udp"
}

resource "aws_security_group_rule" "ssh-elb-to-bastion" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.bastion-kukucluster-com.id}"
  source_security_group_id = "${aws_security_group.bastion-elb-kukucluster-com.id}"
  from_port                = "${var.from_port}"
  to_port                  = "${var.to_port}"
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "ssh-external-to-bastion-elb-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.bastion-elb-kukucluster-com.id}"
  from_port         = "${var.from_port}"
  to_port           = "${var.to_port}"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_subnet" "eu-west-1a-kukucluster-com" {
  vpc_id            = "${aws_vpc.kukucluster-com.id}"
  cidr_block        = "172.20.32.0/19"
  availability_zone = "eu-west-1a"

  tags = {
    KubernetesCluster                       = "kukucluster.com"
    Name                                    = "eu-west-1a.kukucluster.com"
    SubnetType                              = "Private"
    "kubernetes.io/cluster/kukucluster.com" = "owned"
    "kubernetes.io/role/internal-elb"       = "1"
  }
}
