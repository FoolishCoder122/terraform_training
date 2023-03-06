provider "aws" {
  
}
resource "aws_instance" "instance01" {
    ami = "ami-09ba48996007c8b50"
    instance_type = "t2.micro"
    tags = {
      "Name" = "pradipti-web-server"
      "environment" = "Dev"
    }

    provisioner "local-exec" {
      command = "echo ${aws_instance.instance01.public_ip} >ip_address.txt"
    
    } 

  
}


#file provisioner:
#https://developer.hashicorp.com/terraform/language/resources/provisioners/file