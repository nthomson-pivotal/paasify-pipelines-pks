output "opsman_username" {
  value = var.opsman_username
}

output "opsman_password" {
  value       = local.opsman_password
  sensitive   = true
}

output "opsman_decryption_passphrase" {
  value       = local.opsman_decryption_passphrase
  sensitive   = true
}

output "env_name" {
  value = var.env_name
}

output "tls_cert" {
  value = replace(chomp(module.acme.cert_full_chain), "\n", "\\n")
}

output "tls_cert_key" {
  value = replace(chomp(module.acme.cert_key), "\n", "\\n")
}

output "tls_cert_ca" {
  value = replace(chomp(module.acme.cert_ca), "\n", "\\n")
}