## Simple deploy ec2 with terraform

Deploy EC2 instance in AWS with terraform.

How to run:
```sh
export AWS_ACCESS_KEY_ID="anaccesskey"
export AWS_SECRET_ACCESS_KEY="asecretkey"

terraform init
terraform apply
```
By default server opens 8228 TCP port. to change port edit `varibles.tf`
