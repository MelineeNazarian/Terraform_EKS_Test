provider "aws" {
  region = "us-east-1"
}

provider "kubernetes" {
  host                   = module.eks-cluster.cluster_endpoint
  token                  = module.eks-cluster.eks_cluster_token
  cluster_ca_certificate = base64decode(module.eks-cluster.cluster_ca_certificate)
}

terraform {
  #   backend "s3" {
  #     bucket         = "569684837367-state-bucket-dev"
  #     key            = "terraform.tfstate"
  #     region         = "us-east-1"
  #     dynamodb_table = "terraformlock"
  #    }

  required_providers {
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
  }
}
