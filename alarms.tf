resource "aws_cloudwatch_metric_alarm" "lambda_errors" {
  count = var.enable_error_alarm ? 1 : 0

  alarm_name          = "${aws_lambda_function.this.function_name}-${var.environment}-errors"
  alarm_description   = "Errors in ${aws_lambda_function.this.function_name} in ${var.environment} in greater than ${var.error_alarm_threshold}. Runbook: ${var.error_alarm_runbook}"
  namespace           = "AWS/Lambda"
  metric_name         = "Errors"
  comparison_operator = "GreaterThanThreshold"
  threshold           = var.error_alarm_threshold
  evaluation_periods  = "1"
  datapoints_to_alarm = "1"
  period              = "60"

  dimensions = {
    FunctionName = aws_lambda_function.this.function_name
  }

  treat_missing_data = "notBreaching"
  statistic          = "Sum"

  alarm_actions = var.error_alarm_actions
  ok_actions    = var.error_alarm_actions
}
