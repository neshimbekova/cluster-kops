1. Install kops and kubectl
2. Create hosted zone
3. Create a bucket in s3 "kukucluster.com"
4. export KOPS_STATE_STORE="s3://kukucluster.com"
5. kops create cluster --name=kukucluster.com     --node-size="t2.micro"  --master-size="t2.micro" --master-zones="eu-west-1b,eu-west-1a,eu-west-1c" --networking="weave"   --topology="private" --bastion="true"   --dns="private"  --zones="eu-west-1b,eu-west-1a,eu-west-1c" --state="s3://kukucluster.com"   --out=.   --target=terraform --yes
6. After it is created
  kops validate cluste
7. terraform apply -var-file=kukucluster.tfvars
8. terraform destroy -var-file=kukucluster.tfvars
