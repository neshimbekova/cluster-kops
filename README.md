# kuku_cluster

1. kops and kubectl installation
2. hosting domain
3. creating s3 bucket
4. export KOPS_STATE_STORE="s3://kukucluster.com"
5. kops create cluster --name=kukucluster.com     --node-size="t2.micro"  --master-size="t2.micro" --master-zones="eu-west-1b,eu-west-1a,eu-west-1c" --networking="weave"   --topology="private" --bastion="true"   --dns="private"  --zones="eu-west-1b,eu-west-1a,eu-west-1c" --state="s3://kukucluster.com"   --out=.   --target=terraform --yes
6. create repo
7. create bucket to store terraform backend
in case you are working from your laptop you will have to copy .kube/config file from your laptop to a vm
    cat .kube/config on ur terminal
    mkdir .kube
    vi .kube/config
    





