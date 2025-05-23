terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.11.4"
}



module "vpc" {
  source = "./modules/vpc"
}

module "iam" {
  source = "./modules/iam"
  cluster_name = "health-eks-cluster"
}

module "eks" {
  source = "./modules/eks"
  cluster_name = var.cluster_name
  vpc_id = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  private_subnet_ids = module.vpc.private_subnet_ids
  eks_cluster_role_arn = module.iam.eks_cluster_role_arn
  eks_fargate_role_arn = module.iam.eks_fargate_role_arn
}
