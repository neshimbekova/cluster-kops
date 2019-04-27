terraform {
  backend "s3" {
    bucket = "kukucluster.com"
    key    = "state/kukucluster"
    region = "eu-west-1"
  }
}
