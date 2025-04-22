terraform {
  backend "s3" {
    bucket         = "usecase220425"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock220425"
    use_lockfile = true
    encrypt = true
  }
}