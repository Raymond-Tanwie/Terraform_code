module "my-server" {
  source   = "./modules/ec2"
  subnetId = module.network.subnetId
  sg       = module.ray_sg.sg


}

module "network" {
  source   = "./modules/network"
  name     = "primus"
  sbn-cidr = "10.0.1.0/24"
}

module "ray_sg" {
  source = "./modules/security"
  vpcId  = module.network.vpcId
  sg     = "ray-sg"
}

/*module "ray-vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name = "ray-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["use1-az1", "use1-az2"]
  private_subnets = ["10.20.0.0/24"]
  public_subnets  = ["10.20.1.0/24"]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}*/

module "ray-vpc" {
  source   = "./modules/network"
  vpc-cidr = "10.10.0.0/16"
  name     = "ray"
  sbn-cidr = "10.10.0.0/24"
  env = "prod"

}
