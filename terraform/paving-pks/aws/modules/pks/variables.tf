variable "env_name" {
  type = string
}

variable "region" {
  type = string
}

variable "availability_zones" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "private_route_table_ids" {
  type = list(string)
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "zone_id" {
  type = string
}

variable "dns_suffix" {
  type = string
}

variable "use_route53" {
}

variable "tags" {
  type = map(string)
}

module "cidr_lookup" {
  source   = "../calculate_subnets"
  vpc_cidr = var.vpc_cidr
}

locals {
  pks_cidr          = module.cidr_lookup.pks_cidr
  pks_services_cidr = module.cidr_lookup.pks_services_cidr
}

