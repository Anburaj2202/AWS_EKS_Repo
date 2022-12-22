
provider "aws" {
  # version = "2.49.0"
  region  = "eu-central-1"
}


module "Network" {
  source = "./Network"
}

module "Access" {
  source = "./Access"
}


module "Cluster" {
  source = "./Cluster"
  cluster_role_arn =  module.Access.EKS_Cluster_Role_ARN
  cluster_Node_role_arn =  module.Access.EKS_Node_Role_ARN
  Cluster_mgmt_SG_ID = module.Network.Security_Group_ID
  Subnet_01_ID = module.Network.Subnet_01_ID
  Subnet_02_ID = module.Network.Subnet_02_ID
  Subnet_03_ID = module.Network.Subnet_03_ID
}


