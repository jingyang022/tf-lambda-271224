module "lambda" {
 source        = "terraform-aws-modules/lambda/aws"
 version       = "7.8.1"
 function_name = "hello"
 description   = "My awesome lambda function"
 handler       = "hello.lambda_handler"
 runtime       = "python3.8"

 source_path = "./hello.py"
}