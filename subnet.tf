resource "aws_subnet" "eu-west-1b-kukucluster-com" {
  vpc_id            = "${aws_vpc.kukucluster-com.id}"
  cidr_block        = "172.20.64.0/19"
  availability_zone = "eu-west-1b"

  tags = {
    KubernetesCluster                       = "kukucluster.com"
    Name                                    = "eu-west-1b.kukucluster.com"
    SubnetType                              = "Private"
    "kubernetes.io/cluster/kukucluster.com" = "owned"
    "kubernetes.io/role/internal-elb"       = "1"
  }
}

resource "aws_subnet" "eu-west-1c-kukucluster-com" {
  vpc_id            = "${aws_vpc.kukucluster-com.id}"
  cidr_block        = "172.20.96.0/19"
  availability_zone = "eu-west-1c"

  tags = {
    KubernetesCluster                       = "kukucluster.com"
    Name                                    = "eu-west-1c.kukucluster.com"
    SubnetType                              = "Private"
    "kubernetes.io/cluster/kukucluster.com" = "owned"
    "kubernetes.io/role/internal-elb"       = "1"
  }
}

resource "aws_subnet" "utility-eu-west-1a-kukucluster-com" {
  vpc_id            = "${aws_vpc.kukucluster-com.id}"
  cidr_block        = "172.20.0.0/22"
  availability_zone = "eu-west-1a"

  tags = {
    KubernetesCluster                       = "kukucluster.com"
    Name                                    = "utility-eu-west-1a.kukucluster.com"
    SubnetType                              = "Utility"
    "kubernetes.io/cluster/kukucluster.com" = "owned"
    "kubernetes.io/role/elb"                = "1"
  }
}

resource "aws_subnet" "utility-eu-west-1b-kukucluster-com" {
  vpc_id            = "${aws_vpc.kukucluster-com.id}"
  cidr_block        = "172.20.4.0/22"
  availability_zone = "eu-west-1b"

  tags = {
    KubernetesCluster                       = "kukucluster.com"
    Name                                    = "utility-eu-west-1b.kukucluster.com"
    SubnetType                              = "Utility"
    "kubernetes.io/cluster/kukucluster.com" = "owned"
    "kubernetes.io/role/elb"                = "1"
  }
}

resource "aws_subnet" "utility-eu-west-1c-kukucluster-com" {
  vpc_id            = "${aws_vpc.kukucluster-com.id}"
  cidr_block        = "172.20.8.0/22"
  availability_zone = "eu-west-1c"

  tags = {
    KubernetesCluster                       = "kukucluster.com"
    Name                                    = "utility-eu-west-1c.kukucluster.com"
    SubnetType                              = "Utility"
    "kubernetes.io/cluster/kukucluster.com" = "owned"
    "kubernetes.io/role/elb"                = "1"
  }
}
