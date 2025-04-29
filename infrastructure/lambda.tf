resource "aws_lambda_function" "lambda_one" {
  filename         = "../src/IngestorLambda.zip"  
  function_name    = var.lambda_function_one_name
  handler          = "IngestorLambda.handler"
  runtime          = "python3.12"
  role             = var.lambda_role_arn
}

resource "aws_lambda_function" "lambda_two" {
  filename         = "../src/OfferGeneratorLambda.zip"
  function_name    = var.lambda_function_two_name
  handler          = "OfferGeneratorLambda.handler"
  runtime          = "python3.12"
  role             = var.lambda_role_arn
}
