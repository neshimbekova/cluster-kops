resource "aws_key_pair" "kubernetes-kukucluster-com-0dc4429ad65207534614a40e7a9af6cd" {
  key_name   = "kubernetes.kukucluster.com-0d:c4:42:9a:d6:52:07:53:46:14:a4:0e:7a:9a:f6:cd"
  public_key = "${file("${path.module}/data/aws_key_pair_kubernetes.kukucluster.com-0dc4429ad65207534614a40e7a9af6cd_public_key")}"
}
