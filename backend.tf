terraform {
  backend "s3" {
    bucket = "terraform-git-project01-cloudcrafter"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}

