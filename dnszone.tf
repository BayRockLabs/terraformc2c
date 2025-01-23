/*variable "dns_zone_name" {
  description = "The name of the DNS zone"
  type        = string
}

resource "azurerm_dns_zone" "main" {
  name                = var.dns_zone_name
  resource_group_name = azurerm_resource_group.main.name

  depends_on = [azurerm_resource_group.main]
}

resource "azurerm_dns_a_record" "root" {
  name                = "@"
  zone_name           = azurerm_dns_zone.main.name
  resource_group_name = azurerm_resource_group.main.name
  ttl                 = 300
  records             = [azurerm_container_app_environment.main.static_ip_address]

  depends_on = [azurerm_dns_zone.main]
}

resource "azurerm_dns_txt_record" "asuid" {
  name                = "asuid"
  zone_name           = azurerm_dns_zone.main.name
  resource_group_name = azurerm_resource_group.main.name
  ttl                 = 300

  record {
    value = azurerm_container_app.containerapp["frontend"].custom_domain_verification_id
  }

  depends_on = [azurerm_dns_zone.main]
}
*/