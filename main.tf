resource "aws_lambda_function" "this" {
  function_name                  = var.function_name
  role                           = aws_iam_role.lambda.arn
  memory_size                    = var.memory_size
  package_type                   = "Image"
  image_uri                      = var.image_uri
  publish                        = true
  timeout                        = var.timeout
  reserved_concurrent_executions = var.reserved_concurrent_executions

  image_config {
    command = var.image_command
  }

  dynamic "environment" {
    for_each = length(keys(var.environment_variables)) > 0 ? [1] : []

    content {
      variables = var.environment_variables
    }
  }

  dynamic "vpc_config" {
    for_each = var.vpc_subnet_ids != [] ? [1] : []
    content {
      subnet_ids         = var.vpc_subnet_ids
      security_group_ids = flatten([aws_security_group.lambda[*].id, var.security_group_ids])
    }
  }

  tags = merge({
    Git_Repo = var.lambda_git_repo
  }, var.lambda_function_tags)

  depends_on = [
    aws_cloudwatch_log_group.lambda
  ]
}

resource "aws_lambda_alias" "latest" {
  description      = var.function_version_override != null ? "The pinned version of the lambda" : "The latest version of the lambda"
  function_name    = aws_lambda_function.this.function_name
  function_version = coalesce(var.function_version_override, aws_lambda_function.this.version)
  name             = "latest"
}
