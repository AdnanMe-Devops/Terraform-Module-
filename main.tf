n this  step,  will create a module for deploying EC2 Instances and use it in a Terraform configuration.



main.tf
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=3.7.0"
    }
  }
}

resource "aws_instance" "server" {
    ami           = "ami-0d398eb3480cb04e7"
    instance_type = var.instance_size
    monitoring = false
    vpc_security_group_ids = var.security_group_ids
    subnet_id = var.subnet_id          

    root_block_device {
        delete_on_termination = false
        encrypted = true
        volume_size = 20
        volume_type = "standard"
    }

    tags = {
        Name = var.servername
    }
}

This contains the resource block for an EC2 Instance resource. It contains the EC2 standard configurations to be made into a module.  Also, notice that the required_providers block is specified. Because the AWS provider is updated so frequently, it's best practice to specify the version that your module is compatible with. Otherwise newer or older versions of the provider may not work with the module and cause issues
