resource "aws_internet_gateway" "terraform_IG" {
    vpc_id = aws_vpc.my_vpc.id
    tags={
        Name="terraform_Internet_Gateway"
    }
  
}
output "terraform_Internet_Gateway_Id" {
    value = aws_internet_gateway.terraform_IG.id
}