terraform {
  backend "s3" {
    bucket         = "for-tomcat"
    key            = "ray-march/terraform-ray-state"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"

  }
}