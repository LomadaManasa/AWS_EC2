resource "aws_vpc" "my_vpc" {
  cidr_block ="10.0.0.0/16"
  tags={
    Name="terraform_vpc"
  } 
}
resource "aws_subnet" "terraform_publicsubnet" {
    vpc_id = aws_vpc.my_vpc.id
    tags={
        Name="terraform_public_subnet"
    }
    cidr_block = "10.0.1.0/24"
  
}
resource "aws_subnet" "terraform_privatesubnet" {
    vpc_id = aws_vpc.my_vpc.id
    tags={
        Name="terraform_private_subnet"
    }
    cidr_block = "10.0.2.0/24"
  
}
output "vpc_id" {
    value= aws_vpc.my_vpc.id
}
output "public_subnet_id" {
  value = aws_subnet.terraform_publicsubnet.id
}
output "private_subnet_id" {
  value = aws_subnet.terraform_privatesubnet.id
}