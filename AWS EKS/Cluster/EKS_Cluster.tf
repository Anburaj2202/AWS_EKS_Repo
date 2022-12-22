resource "aws_eks_cluster" "EKS_Anbu_01" {
  name     = "EKS_Anbu_01"
  role_arn =  "${var.cluster_role_arn}"
  version  = "1.21"
  vpc_config {  
   security_group_ids = [var.Cluster_mgmt_SG_ID]
   subnet_ids         = [var.Subnet_01_ID,var.Subnet_02_ID,var.Subnet_03_ID] 
    }
}


resource "aws_eks_node_group" "node1" {
  cluster_name    = aws_eks_cluster.EKS_Anbu_01.name
  node_group_name = "EKS-Node-Group-Anbu-01"
  node_role_arn   = var.cluster_Node_role_arn
  subnet_ids      = [var.Subnet_01_ID,var.Subnet_02_ID]

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 2
  }

}

resource "aws_eks_node_group" "node2" {
  cluster_name    = aws_eks_cluster.EKS_Anbu_01.name
  node_group_name = "EKS-Node-Group-Anbu-02"
  node_role_arn   = var.cluster_Node_role_arn
  subnet_ids      = [var.Subnet_03_ID,var.Subnet_02_ID]

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 2
  }


}

resource "aws_eks_node_group" "node3" {
  cluster_name    = aws_eks_cluster.EKS_Anbu_01.name
  node_group_name = "EKS-Node-Group-Anbu-03"
  node_role_arn   = var.cluster_Node_role_arn
  subnet_ids      = [var.Subnet_03_ID,var.Subnet_01_ID]

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 2
  }

}
