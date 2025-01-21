output "frontend_url" {
  description = "The URL of the frontend container app"
  value       = azurerm_container_app.containerapp["frontend"].ingress[0].fqdn
}

output "dns_ns_records" {
  description = "The NS records of the DNS zone"
  value       = azurerm_dns_zone.main.name_servers
}