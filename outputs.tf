output "cloudwatch_log_group_arn" {
  value = aws_cloudwatch_log_group.lambda.arn
}

/***

 __          __             _____    _   _   _____   _   _    _____
 \ \        / /     /\     |  __ \  | \ | | |_   _| | \ | |  / ____|
  \ \  /\  / /     /  \    | |__) | |  \| |   | |   |  \| | | |  __
   \ \/  \/ /     / /\ \   |  _  /  | . ` |   | |   | . ` | | | |_ |
    \  /\  /     / ____ \  | | \ \  | |\  |  _| |_  | |\  | | |__| |
     \/  \/     /_/    \_\ |_|  \_\ |_| \_| |_____| |_| \_|  \_____|

USE THE ALIAS WHERE POSSIBLE

**/

output "_please_avoid_using_me_wherever_possible_lambda_arn" {
  value = aws_lambda_function.this.arn
}

output "iam_role_arn" {
  value = aws_iam_role.lambda.arn
}

output "iam_role_id" {
  value = aws_iam_role.lambda.id
}

output "lambda_alias_arn" {
  description = "The ARN of the latest published Lambda"
  value       = aws_lambda_alias.latest.arn
}

output "lambda_alias_name" {
  description = "The lambda alias name, can be used in an aws_lambda_permission qualifier"
  value       = aws_lambda_alias.latest.name
}

output "lambda_version_arn" {
  description = "The ARN of the Lambda, but use the alias where possible"
  value       = "${aws_lambda_function.this.arn}:${coalesce(var.function_version_override, aws_lambda_function.this.version)}"
}

output "lambda_name" {
  value = aws_lambda_function.this.function_name
}

output "security_group_id" {
  value = aws_security_group.lambda != [] ? aws_security_group.lambda[0].id : null
}
