resource "aws_s3_bucket" "tf_state" {
    bucket = "terrform-states"
    acl = "private"
}