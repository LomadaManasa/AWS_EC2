resource "aws_eip" "terraform_eip" {
    tags={
        Name="terraform_eip"
    }
}
output "eip_id" {
  value = aws_eip.terraform_eip.id
}