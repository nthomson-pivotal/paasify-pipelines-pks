locals {
  opsman_password              = "${var.opsman_password == "" ? random_string.opsman_password.result : var.opsman_password}"
  opsman_decryption_passphrase = "${var.opsman_decryption_passphrase == "" ? random_string.opsman_decryption_passphrase.result : var.opsman_decryption_passphrase}"
}

resource "random_string" "opsman_password" {
  length  = 8
  special = false
}

resource "random_string" "opsman_decryption_passphrase" {
  length  = 16
  special = false
}

locals {
  base_domain = "${var.env_name}.${var.dns_suffix}"
}

module "acme" {
  source = "github.com/nthomson-pivotal/paasify-core//acme/aws"

  dns_zone_id        = module.infra.zone_id
  opsmanager_domain  = module.ops_manager.dns
  additional_domains = ["*.apps.${local.base_domain}", "*.sys.${local.base_domain}", "*.uaa.sys.${local.base_domain}", "*.login.sys.${local.base_domain}"]
}

data "aws_route53_zone" "selected" {
  name = "${var.dns_suffix}."
}

module "ns_record" {
  source = "../paving-pks/aws/modules/add_ns_to_hosted_zone"

  top_level_zone_id = data.aws_route53_zone.selected.zone_id
  zone_name         = local.base_domain
  name_servers      = module.infra.name_servers
}