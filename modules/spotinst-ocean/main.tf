
module "ocean-controller" {
  source = "spotinst/ocean-controller/spotinst"

  # Credentials.
  spotinst_token   = data.aws_secretsmanager_secret_version.secret_credentials.secret_string
  spotinst_account = var.spotinst_account

  # Configuration.
  cluster_identifier = var.cluster_name
}

module "ocean-aws-k8s" {
  source  = "spotinst/ocean-aws-k8s/spotinst"
  version = "1.2.0"

  # Configuration
  cluster_name                     = var.cluster_name
  region                           = var.region
  subnet_ids                       = data.aws_vpc.dpe_prod_vpc.private_subnets
  worker_instance_profile_arn      = tolist(data.aws_iam_instance_profiles.profile.arns)[0]
  security_groups                  = [module.eks.node_security_group_id]
  is_aggressive_scale_down_enabled = true
  max_scale_down_percentage        = 33
  # Overwrite Name Tag and add additional
  # tags = {
  #   "kubernetes.io/cluster/tyu-spot-ocean" = "owned"
  # }
}