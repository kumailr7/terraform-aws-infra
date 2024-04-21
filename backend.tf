terraform {
  backend "s3" {
    encrypt = true    
    bucket = "terrform-states"
    dynamodb_table = "terraform-state-lock-dynamo"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}


###### Creating Dyanmo DB table For State Locking ######
resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name = "terraform-state-lock-dynamo"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
 
  attribute {
    name = "LockID"
    type = "S"
  }
}