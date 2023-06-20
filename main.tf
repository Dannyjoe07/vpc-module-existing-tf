locals {

#   db_subnets_ids    = flatten([data.aws_subnet_ids.dbA.*.ids, data.aws_subnet_ids.dbB.*.ids])
#   appli_subnets_ids = flatten([data.aws_subnet_ids.appliA.*.ids, data.aws_subnet_ids.appliB.*.ids])
  public_subnets_ids = flatten([data.aws_subnets.publicA.*.ids, data.aws_subnets.publicB.*.ids])
  tags_vpc = { Name = "${lower(var.vpc_name)}-vpc}" }

}

data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = [local.tags_vpc.Name]
  }
}

data "aws_subnets" "publicA" {
  vpc_id = data.aws_vpc.selected.id
 
  filter {
    name   = "availability-zone"
    values = ["*a"]
  }
  filter {
    name   = "tag:Name"
    values = ["*public*","*public*"]
  }
}

data "aws_subnets" "publicB" {
  vpc_id = data.aws_vpc.selected.id

  filter {
    name   = "availability-zone"
    values = ["*b"]
  }
  filter {
    name   = "tag:Name"
    values = ["*public*","*public*"]
  }
 
}

data "aws_default_security_group" "default" {
  vpc_id = data.aws_vpc.selected.id
}
