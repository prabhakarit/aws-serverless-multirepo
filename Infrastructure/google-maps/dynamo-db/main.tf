terraform {
  backend "s3" {}
}
resource "aws_dynamodb_table" "dynamodb-cache" {
  name           = "${var.environment}-${var.type}-cache"
  billing_mode   = "${var.billing_mode}"
  #read_capacity  = "${var.read_capacity}"
  #write_capacity = "${var.write_capacity}"
  hash_key       = "key"
  range_key      = "type"
  table_class = "${var.table_class}"

  attribute {
    name = "key"
    type = "S"
  }

  attribute {
    name = "type"
    type = "S"
  }

  ttl {
    attribute_name = "${var.ttl_attribute}"
    enabled        = "${var.ttl_enabled}"
  }
}