resource "aws_internet_gateway" "kukucluster-com" {
  vpc_id = "${aws_vpc.kukucluster-com.id}"

  tags = {
    KubernetesCluster                       = "kukucluster.com"
    Name                                    = "kukucluster.com"
    "kubernetes.io/cluster/kukucluster.com" = "owned"
  }
}
