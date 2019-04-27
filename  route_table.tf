resource "aws_route_table" "kukucluster-com" {
  vpc_id = "${aws_vpc.kukucluster-com.id}"

  tags = {
    KubernetesCluster                       = "kukucluster.com"
    Name                                    = "kukucluster.com"
    "kubernetes.io/cluster/kukucluster.com" = "owned"
    "kubernetes.io/kops/role"               = "public"
  }
}

resource "aws_route_table" "private-eu-west-1a-kukucluster-com" {
  vpc_id = "${aws_vpc.kukucluster-com.id}"

  tags = {
    KubernetesCluster                       = "kukucluster.com"
    Name                                    = "private-eu-west-1a.kukucluster.com"
    "kubernetes.io/cluster/kukucluster.com" = "owned"
    "kubernetes.io/kops/role"               = "private-eu-west-1a"
  }
}

resource "aws_route_table" "private-eu-west-1b-kukucluster-com" {
  vpc_id = "${aws_vpc.kukucluster-com.id}"

  tags = {
    KubernetesCluster                       = "kukucluster.com"
    Name                                    = "private-eu-west-1b.kukucluster.com"
    "kubernetes.io/cluster/kukucluster.com" = "owned"
    "kubernetes.io/kops/role"               = "private-eu-west-1b"
  }
}

resource "aws_route_table" "private-eu-west-1c-kukucluster-com" {
  vpc_id = "${aws_vpc.kukucluster-com.id}"

  tags = {
    KubernetesCluster                       = "kukucluster.com"
    Name                                    = "private-eu-west-1c.kukucluster.com"
    "kubernetes.io/cluster/kukucluster.com" = "owned"
    "kubernetes.io/kops/role"               = "private-eu-west-1c"
  }
}

resource "aws_route_table_association" "private-eu-west-1a-kukucluster-com" {
  subnet_id      = "${aws_subnet.eu-west-1a-kukucluster-com.id}"
  route_table_id = "${aws_route_table.private-eu-west-1a-kukucluster-com.id}"
}

resource "aws_route_table_association" "private-eu-west-1b-kukucluster-com" {
  subnet_id      = "${aws_subnet.eu-west-1b-kukucluster-com.id}"
  route_table_id = "${aws_route_table.private-eu-west-1b-kukucluster-com.id}"
}

resource "aws_route_table_association" "private-eu-west-1c-kukucluster-com" {
  subnet_id      = "${aws_subnet.eu-west-1c-kukucluster-com.id}"
  route_table_id = "${aws_route_table.private-eu-west-1c-kukucluster-com.id}"
}

resource "aws_route_table_association" "utility-eu-west-1a-kukucluster-com" {
  subnet_id      = "${aws_subnet.utility-eu-west-1a-kukucluster-com.id}"
  route_table_id = "${aws_route_table.kukucluster-com.id}"
}

resource "aws_route_table_association" "utility-eu-west-1b-kukucluster-com" {
  subnet_id      = "${aws_subnet.utility-eu-west-1b-kukucluster-com.id}"
  route_table_id = "${aws_route_table.kukucluster-com.id}"
}

resource "aws_route_table_association" "utility-eu-west-1c-kukucluster-com" {
  subnet_id      = "${aws_subnet.utility-eu-west-1c-kukucluster-com.id}"
  route_table_id = "${aws_route_table.kukucluster-com.id}"
}
