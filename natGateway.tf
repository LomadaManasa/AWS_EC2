resource "aws_nat_gateway" "terraform_NG" {
  tags={
    Name="terraform_NatGateway"
  }
  subnet_id = aws_subnet.terraform_publicsubnet.id
  connectivity_type = "public"
  allocation_id = aws_eip.terraform_eip.id

  depends_on = [
    aws_internet_gateway.terraform_IG
  ]
}
output "NatGateway_id" {
  value = aws_nat_gateway.terraform_NG.id
}