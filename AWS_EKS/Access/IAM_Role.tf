resource "aws_iam_role" "iam-role-eks-cluster" {
  name = "iam-role-eks-cluster"
  assume_role_policy = jsonencode(
  {
   "Version": "2012-10-17",
   "Statement": [
     {
     "Effect": "Allow",
     "Principal": {
      "Service": "eks.amazonaws.com"
     },
     "Action": "sts:AssumeRole"
     }
    ]
   })
}



resource "aws_iam_role_policy_attachment" "eks-cluster-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = "${aws_iam_role.iam-role-eks-cluster.name}"
}



resource "aws_iam_role" "iam-role-eks_nodes" {
  name = "Role-Anbu-EKS-Node-Group"

  assume_role_policy = jsonencode(
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
})
}

# Attaching the different Policies to Node Members.

resource "aws_iam_role_policy_attachment" "AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.iam-role-eks_nodes.name
}

resource "aws_iam_role_policy_attachment" "AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.iam-role-eks_nodes.name
}

resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.iam-role-eks_nodes.name
}

output "EKS_Cluster_Role_ARN" {
  value = resource.aws_iam_role.iam-role-eks-cluster.arn
}

output "EKS_Node_Role_ARN" {
  value = resource.aws_iam_role.iam-role-eks_nodes.arn
}
