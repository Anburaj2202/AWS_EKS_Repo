resource "aws_security_group" "SG-Worker_Node_Group_Anbu-01" {
  name_prefix = "SG-Worker_Node_Group_Anbu-01"
  vpc_id      = var.VPC_Anbu_ID

  ingress {
    from_port = 0
    to_port   = 56654
    protocol  = "tcp"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }
}

output "Security_Group_Name" {
  value = resource.aws_security_group.SG-Worker_Node_Group_Anbu-01.name
}

output "Security_Group_ID" {
  value = resource.aws_security_group.SG-Worker_Node_Group_Anbu-01.id
}