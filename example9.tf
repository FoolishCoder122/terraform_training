provider "aws" {
region = "ap-south-1"
}
data "aws_ami" "amazon_linux_2" {
most_recent = true
owners = ["amazon"]
filter {
name = "name"
values = ["amzn2-ami-hvm*"]
}
}
output "amazon-ami" {
value = "${data.aws_ami.amazon_linux_2.id}"
}
resource "aws_key_pair" "awsKey" {
key_name = "appserverKey"
public_key = "${file("$HOME/.ssh/id_rsa.pub")}"
}
resource "aws_instance" "instance01" {
ami = data.aws_ami.amazon_linux_2.id
instance_type = "t2.micro"
key_name = aws_key_pair.awsKey.key_name
tags = {
Name = "terraform-example"
}
security_groups = ["${aws_security_group.AWSaccess.name}"]
}
resource "aws_security_group" "AWSaccess" {
name = "AWSaccess"
description = "SSH access"
ingress {
protocol = "tcp"
from_port = 22
to_port = 22
cidr_blocks = ["0.0.0.0/0"]
}
}