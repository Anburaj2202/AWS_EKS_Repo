data "aws_vpc" "VPC" {
  id = var.VPC_Anbu_ID
}

data "aws_subnet" "Subnet_01" {
  id = var.Subnet_Anbu_01_ID
}

data "aws_subnet" "Subnet_02" {
  id = var.Subnet_Anbu_02_ID
}

data "aws_subnet" "Subnet_03" {
  id = var.Subnet_Anbu_03_ID
}


output "VPC_CIDR" {
  value = data.aws_vpc.VPC.cidr_block
}

output "Subnet_01_CIDR" {
  value = data.aws_subnet.Subnet_01.cidr_block
}

output "Subnet_02_CIDR" {
  value = data.aws_subnet.Subnet_02.cidr_block
}

output "Subnet_03_CIDR" {
  value = data.aws_subnet.Subnet_03.cidr_block
}


output "Subnet_01_ID" {
  value = data.aws_subnet.Subnet_01.id
}

output "Subnet_02_ID" {
  value = data.aws_subnet.Subnet_02.id
}

output "Subnet_03_ID" {
  value = data.aws_subnet.Subnet_03.id
}

