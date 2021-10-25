variable "instance_size" {
    description = "Size of the EC2 instance"
    type = string
    default = "t2.micro"
}

variable "servername" {
    description = "Name of the EC2 Instance tag"
    type = string
}

variable "subnet_id" {
    description = "Subnet ID assigned to the EC2 Instance"
    type = string
}

variable "security_group_ids" {
    description = "Security group IDs assigned to the EC2 Instance"
    type = list(string)
}
The variables will be used as input for the module to enable the EC2 to be customized per environment. The module will take the input for subnet and security group IDs to allow the module to be deployed to various environments. This makes the module reusable since the environment isn't hardcoded into the Terraform configuration. 

 output "id" {
    description = "id of EC2"
    value = aws_instance.server.id
}
The output block will allow the module to output the ID value of the EC2 so it can be passed through to other resources within a Terraform configuration. 

 
