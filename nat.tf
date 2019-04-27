resource "aws_nat_gateway" "eu-west-1a-kukucluster-com" {
  allocation_id = "${aws_eip.eu-west-1a-kukucluster-com.id}"
  subnet_id     = "${aws_subnet.utility-eu-west-1a-kukucluster-com.id}"

  tags = {
    KubernetesCluster                       = "kukucluster.com"
    Name                                    = "eu-west-1a.kukucluster.com"
    "kubernetes.io/cluster/kukucluster.com" = "owned"
  }
}

resource "aws_nat_gateway" "eu-west-1b-kukucluster-com" {
  allocation_id = "${aws_eip.eu-west-1b-kukucluster-com.id}"
  subnet_id     = "${aws_subnet.utility-eu-west-1b-kukucluster-com.id}"

  tags = {
    KubernetesCluster                       = "kukucluster.com"
    Name                                    = "eu-west-1b.kukucluster.com"
    "kubernetes.io/cluster/kukucluster.com" = "owned"
  }
}

resource "aws_nat_gateway" "eu-west-1c-kukucluster-com" {
  allocation_id = "${aws_eip.eu-west-1c-kukucluster-com.id}"
  subnet_id     = "${aws_subnet.utility-eu-west-1c-kukucluster-com.id}"

  tags = {
    KubernetesCluster                       = "kukucluster.com"
    Name                                    = "eu-west-1c.kukucluster.com"
    "kubernetes.io/cluster/kukucluster.com" = "owned"
  }
}
