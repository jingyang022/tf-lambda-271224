# Define an archive_file datasource that creates the lambda archive
data "archive_file" "lambda" {
 type        = "zip"
 source_file = "hello.py"
 output_path = "hello.zip"
}

resource "aws_lambda_function" "hello_world_lambda" {
 function_name = "hello_world_lambda"
 role          = aws_iam_role.lambda_exec_role.arn
 handler       = "hello.lambda_handler"
 runtime       = "python3.8"
 filename      = data.archive_file.lambda.output_path
}

# aws_cloudwatch_log_group to get the logs of the Lambda execution.
resource "aws_cloudwatch_log_group" "lambda_log_group" {
 name              = "/aws/lambda/hello_world_lambda"
 retention_in_days = 14
}