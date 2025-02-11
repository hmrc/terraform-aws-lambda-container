data "aws_subnet" "this" {
  for_each = toset(var.vpc_subnet_ids)

  id = each.value
}

data "aws_vpc" "vpc" {
  count = length(var.vpc_subnet_ids) > 0 ? 1 : 0

  id = data.aws_subnet.this[var.vpc_subnet_ids[0]].vpc_id
}

resource "aws_security_group" "lambda" {
  count = data.aws_vpc.vpc != [] ? 1 : 0

  name        = var.function_name
  description = "Security group for the ${var.function_name} lambda"
  vpc_id      = data.aws_vpc.vpc[0].id

  lifecycle {
    ignore_changes = [description]
  }
}
