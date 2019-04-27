resource "aws_eip" "eu-west-1b-kukucluster-com" {
  vpc = true

  tags = {
    KubernetesCluster                       = "kukucluster.com"
    Name                                    = "eu-west-1b.kukucluster.com"
    "kubernetes.io/cluster/kukucluster.com" = "owned"
  }
}

resource "aws_eip" "eu-west-1c-kukucluster-com" {
  vpc = true

  tags = {
    KubernetesCluster                       = "kukucluster.com"
    Name                                    = "eu-west-1c.kukucluster.com"
    "kubernetes.io/cluster/kukucluster.com" = "owned"
  }
}

resource "aws_eip" "eu-west-1a-kukucluster-com" {
  vpc = true

  tags = {
    KubernetesCluster                       = "kukucluster.com"
    Name                                    = "eu-west-1a.kukucluster.com"
    "kubernetes.io/cluster/kukucluster.com" = "owned"
  }
}
