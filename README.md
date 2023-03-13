# Deploying WordPress on an EC2 instance(Ubuntu)

 - Run the following on your terminal (to set the credentials):
```sh
export AWS_ACCESS_KEY_ID="<your access key id>"
export AWS_SECRET_ACCESS_KEY="<your secret access key>"
```
> Note: Follow these steps to generate access key ID and secret access key if you don't have one: https://docs.aws.amazon.com/powershell/latest/userguide/pstools-appendix-sign-up.html 

 - Clone this repo: 
```sh
git clone git@github.com:pradip10/c1.git
```
 - Make acoupe of changes
  -- In `pub_key.tf` replace *public_key* with your public key. Else you'll not be al to login to the machine.
  -- In `variables.tf` replace the default value of *ec2_ami_id* with the right AMI id for your region.

 - Apply the terraform code: 
```sh
terraform init
terraform apply -auto-approve
```
 - Check if the EC2 instance is ready in the AWS Web console. It will take a few minutes to provision.
 - Once ready the WordPress is deployed and can be access at `http://<public ip>/wordpress`

> Note: Before you can start to use the application you need to configure the database. Refer here or the steps: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/hosting-wordpress.html#install-wordpress
