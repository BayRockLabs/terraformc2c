output "frontend_url" {
  description = "The URL of the frontend container app"
  value       = azurerm_container_app.containerapp["frontend"].ingress[0].fqdn
}

output "backend_url" {
  description = "The URL of the backend container app"
  value       = azurerm_container_app.containerapp["backend"].ingress[0].fqdn
}

output "authservice_url" {
  description = "The URL of the authservice container app"
  value       = azurerm_container_app.containerapp["authservice"].ingress[0].fqdn
}

output "brlc2cdocumentparser_url" {
  description = "The URL of the brlc2cdocumentparser container app"
  value       = azurerm_container_app.containerapp["brlc2cdocumentparser"].ingress[0].fqdn
}

output "dns_zone_name" {
  description = "The name of the DNS zone"
  value       = azurerm_dns_zone.main.name
}

output "dns_ns_records" {
  description = "The NS records of the DNS zone"
  value       = azurerm_dns_zone.main.name_servers
}