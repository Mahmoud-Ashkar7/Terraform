terraform {
  backend "s3" {
    bucket = "minetbucket"
    key    = "terraform.tfstat"
    region = "us-east-1" 
  }
}