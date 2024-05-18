data "aws_vpc" "dpe_prod_vpc" {
  name = "dpe-prod-vpc"
}

data "aws_eks_cluster" "example" {
  name = "dpe-k8"
}

data "aws_iam_instance_profiles" "profile" {
  role_name  = data.eks.eks_managed_node_groups["one"].iam_role_name
}
