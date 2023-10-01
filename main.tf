/*module "my-server" {
  source   = "./modules/ec2"
  subnetId = module.network.subnetId
  sg       = module.ray_sg.sg


}

module "network" {
  source   = "./modules/network"
  name     = "primus"
  sbn-cidr = "10.0.1.0/24"
  env = "prod"
}

module "ray_sg" {
  source = "./modules/security"
  vpcId  = module.network.vpcId
  sg     = "ray-sg"
}*/

/*module "ray-vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name = "ray-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["use1-az1"]
  private_subnets = ["10.0.20.0/24"]
  public_subnets  = ["10.0.15.0/24"]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}*/

/*module "ray-vpc" {
  source   = "./modules/network"
  vpc-cidr = "10.10.0.0/16"
  name     = "ray"
  sbn-cidr = "10.10.0.0/24"
  env = "prod"

}

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "rayttt"
  

  tags = {
    env = "prod"
    owner = "ray"
  }

}*/

module "git-module-vpc" {
  source = "github.com/Raymond-Tanwie/Terraform_code/modules/network"
  vpc-cidr = "10.30.0.0/16"
  name = "ray-vpc"
  sbn-cidr = "10.30.0.0/24"
  azs = "us-east-1a"
  env = "prod"
}

module "git-module-sg" {
source = "github.com/Raymond-Tanwie/Terraform_code/modules/security"
vpcId = module.git-module-vpc.vpcId
sg = "ray-sg"
}