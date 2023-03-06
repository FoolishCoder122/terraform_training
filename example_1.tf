provider "aws" {
    region = "ap-south-1"
    access_key = "AKIA4MFLODBGCV4ZCMGB"
    secret_key = "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"
  
}
resource "aws_instance" "instance01" {
    ami = "ami-09ba48996007c8b50"
    instance_type = "t2.micro"
  
}
#id=i-0136918d15abc34e9