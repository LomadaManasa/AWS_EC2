resource "aws_route_table" "terraform_route_table" {
  vpc_id = aws_vpc.my_vpc.id
  tags={
    Name="terraform_public_route_table"
  }
}
resource "aws_route_table" "terraform_route_table2" {
  vpc_id = aws_vpc.my_vpc.id
  tags={
    Name="terraformprivate_route_table"
  }
}
resource "aws_route" "terraform_route_rule1" {
  route_table_id = aws_route_table.terraform_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.terraform_IG.id
}
resource "aws_route_table_association" "route_table_association" {
  subnet_id = aws_subnet.terraform_publicsubnet.id
  route_table_id = aws_route_table.terraform_route_table.id
}
resource "aws_route" "terraform_route_rule3" {
  route_table_id = aws_route_table.terraform_route_table2.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_nat_gateway.terraform_NG.id
}
resource "aws_route_table_association" "route_table_association1" {
  subnet_id = aws_subnet.terraform_privatesubnet.id
  route_table_id = aws_route_table.terraform_route_table2.id
}