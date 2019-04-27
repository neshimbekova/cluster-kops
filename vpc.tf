resource "aws_vpc" "kukucluster-com" {
  cidr_block           = "172.20.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    KubernetesCluster                       = "kukucluster.com"
    Name                                    = "kukucluster.com"
    "kubernetes.io/cluster/kukucluster.com" = "owned"
  }
}

resource "aws_vpc_dhcp_options" "kukucluster-com" {
  domain_name         = "eu-west-1.compute.internal"
  domain_name_servers = ["AmazonProvidedDNS"]

  tags = {
    KubernetesCluster                       = "kukucluster.com"
    Name                                    = "kukucluster.com"
    "kubernetes.io/cluster/kukucluster.com" = "owned"
  }
}

resource "aws_vpc_dhcp_options_association" "kukucluster-com" {
  vpc_id          = "${aws_vpc.kukucluster-com.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.kukucluster-com.id}"
}
