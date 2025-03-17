terraform {
    backend "s3" {
      bucket = "terraform-effulgence-s3-remote"
      key = "networking/terraform.tfstate"
        region = "us-east-1"
        encrypt = true 
        dynamodb_table = "terraform_aws-networking_state_lock"
  
  }
}