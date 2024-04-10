resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits = 4096
}
resource "tls_private_key" "rsa1" {
 algorithm = "RSA"
 rsa_bits = 4096 
}
resource "aws_key_pair" "terraform_publicEc2key_pair" {
    key_name = "terraform_public_ec2_key_pair"
    public_key = tls_private_key.rsa.public_key_openssh
}
resource "aws_key_pair" "terraform_privateEc2key_pair" {
    key_name = "terraform_private_ec2_key_pair"
    public_key = tls_private_key.rsa1.public_key_openssh
}
/*resource "local_file" "terraform_publicEc2keypair_save" {
  content = tls_private_key.rsa.private_key_pem
  filename = "terraform_public_ec2_private_key.pem"
}
resource "local_file" "terraform_privateEc2keypair_save" {
  content = tls_private_key.rsa1.private_key_pem
  filename = "terraform_private_ec2_private_key.pem"
}*/
resource "aws_instance" "terraform_public_ec2" {
    tags={
        Name="terraform_public_ec2"
    }
    ami = "ami-0b828c1c5ac3f13ee"
    instance_type = "t2.micro"
    key_name = "terraform_public_ec2_key_pair"
    subnet_id = aws_subnet.terraform_publicsubnet.id
    vpc_security_group_ids = [ aws_security_group.terraform_SG.id ]
    associate_public_ip_address = true
}
resource "aws_instance" "terraform_private_ec2" {
    tags={
        Name="terraform_private_ec2"
    }
    ami = "ami-0b828c1c5ac3f13ee"
    instance_type = "t2.micro"
    key_name = "terraform_private_ec2_key_pair"
    subnet_id = aws_subnet.terraform_privatesubnet.id
    vpc_security_group_ids = [ aws_security_group.terraform_SG.id ]
}
