resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "Student"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "StdId"

  attribute {
    name = "StdId"
    type = "S"
  }


  tags = {
    Name        = "demo-dynamodb-table"
    Environment = "test"
  }
}

########### items in the table###############
resource "aws_dynamodb_table_item" "item1" {
    depends_on = [
      aws_dynamodb_table.basic-dynamodb-table
    ]
  table_name = aws_dynamodb_table.basic-dynamodb-table.name
  hash_key   = aws_dynamodb_table.basic-dynamodb-table.hash_key

  item = <<ITEM
{
  "StdId": {"S": "001"},
  "FName": {"S": "Saroj"},
  "LName": {"S": "Shah"},
  "Score": {"N": "85"},
  "Cell": {"S": "1234567890"}
}
ITEM
}
resource "aws_dynamodb_table_item" "item2" {
    depends_on = [
      aws_dynamodb_table.basic-dynamodb-table
    ]
  table_name = aws_dynamodb_table.basic-dynamodb-table.name
  hash_key   = aws_dynamodb_table.basic-dynamodb-table.hash_key

  item = <<ITEM
{
  "StdId": {"S": "002"},
  "FName": {"S": "Rabindra"},
  "LName": {"S": "Shah"},
  "Score": {"N": "89"},
  "Cell": {"S": "123123120"}
}
ITEM
}