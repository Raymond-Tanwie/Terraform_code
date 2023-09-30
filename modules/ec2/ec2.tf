/*data "aws_ami" "amazon_linx2" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}*/



resource "aws_instance" "ray_instance" {

  ami                    = "ami-04cb4ca688797756f" //data.aws_ami.amzn_linx2.id
  instance_type          = var.instancetype
  key_name               = aws_key_pair.test-key.key_name 
  subnet_id              = var.subnetId //aws_subnet.Raymond.id
  vpc_security_group_ids = [var.sg] //aws_security_group.ray-sg.id]
  


  //user_data = file(var.userData)
  //user_data_replace_on_change = true

  tags = {
    Name = var.tags
  }

}

resource "aws_key_pair" "test-key" {
  key_name = "test-key"
  #public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDrshM6FHhvHoq8SUEJ6NADYgMUnAdRnte1P3Eo92zgaNVpYKmOpT+nfuTwnpEgqb6RybsvzNmm8MWBcUTMkcuc7G4Qv4vtSWKum+ROMnoAamfug/815D6JZMHw70Qz6bE7sC+W/uTHLE72PGvlemF9e+ccuqSw2jAqYvstmn4MoDKYd0tBac0omgmxaSwzv/ri/Jrg6Akl2GChPWA6H+yWKFonf6vSkMvSVPCYL5A/BVXPx2hQiKUJHT3Ecv1I5GuBTR+fYpIU89wFBxfZGtJVCdfm/4VdOy3spr5pfkfVojUB/gxSkPs3SkQRHQ4pAa2WKY1h8jDQnNP+Uc9BOMx19gC7WoTntbMZf7EzSKKC1tFNZ9xhxMWuMECBB6RdheDQ5Cm6Pu809gwICBCzu5amkhmx6Vh8L2Q615XQIxMtln/MjRtvk9jYiLIDXEtUIFPJiek74xmA3hQ93ysCLb2k2fjttBvyWp3O7O5SdHV2j6sp11K1XJYYeHm5Fjqa+Us= HP@DESKTOP-6TUGPTU"
  public_key = file(var.KeyName)
}
