provider "aws" {

}
resource "aws_instance" "instance02" {
    ami = "ami-09ba48996007c8b50"
    instance_type = "t2.micro"
    tags = {
        "Name"= "web-server-pradipti"
        "environment" = "dev"   
    }
  
}

resource "aws_eip" "newIP" {
    instance  =aws_instance.instance02.id
    vpc = true
  
}



resource "aws_instance" "instance03" {
    ami = "ami-09ba48996007c8b50"
    instance_type = "t2.micro"
    tags = {
      "Name" = "appserverPradipti"
      "environment" = "stage"

    }
  
}
