##Main terraform file code
terraform {
  required_version = ">= 1.0.9"
  backend "s3" {
    bucket = "demo-lambda-ci-cd-2021"
    key    = "dev/terraform.tfstate"
    region = "ap-south-1"
    encrypt = true
  }
}

provider aws {
  access_key = var.aws_access_key
  secret_key = var.aws_secert_key
  region = var.region
}

resource aws_lambda_function first_lambda {
 function_name = "var.function_name"
 role = "arn:aws:iam::327211245607:role/lambda-ex"
 timeout = 300
 image_uri = "327211245607.dkr.ecr.ap-south-1.amazonaws.com/lambda-ecr-demo:latest"
 package_type = "Image"
}