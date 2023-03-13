variable "ec2_instance_type" {
    description = "The size of the instance"
    type = string 
    default = "t2.micro"
}

variable "ec2_ami_id" {
    description = "The AMI id"
    type = string 
    default = "ami-0557a15b87f6559cf"
}