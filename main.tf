variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resource group"
  type        = string
}

variable "acr_name" {
  description = "The name of the Azure Container Registry"
  type        = string
}

variable "acr_resource_group_name" {
  description = "The resource group name of the Azure Container Registry"
  type        = string
}

variable "acr_login_server" {
  description = "The login server of the Azure Container Registry"
  type        = string
}

variable "acr_admin_username" {
  description = "The admin username of the Azure Container Registry"
  type        = string
}

variable "sas_token" {
  type = string
}

variable "acr_admin_password" {
  description = "The admin password of the Azure Container Registry"
  type        = string
}

variable "container_apps" {
  description = "List of container apps with their respective image names, tags, and ports"
  type = list(object({
    name        = string
    image_name  = string
    image_tag   = string
    port        = number
  }))
}

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_container_app_environment" "main" {
  name                = "my-container-app-environment"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  depends_on = [azurerm_resource_group.main]
}

data "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.acr_resource_group_name
}

resource "azurerm_container_app" "containerapp" {
  for_each = { for app in var.container_apps : app.name => app }

  name                         = each.value.name
  container_app_environment_id = azurerm_container_app_environment.main.id
  resource_group_name          = azurerm_resource_group.main.name
  revision_mode                = "Single"

  secret {
    name  = "acr-username"
    value = var.acr_admin_username
  }

  secret {
    name  = "acr-password"
    value = var.acr_admin_password
  }

  registry {
    server               = var.acr_login_server
    username             = var.acr_admin_username
    password_secret_name = "acr-password"
  }

  template {
    container {
      name   = each.value.name
      image  = "${var.acr_login_server}/${each.value.image_name}:${each.value.image_tag}"
      cpu    = 1
      memory = "2Gi"

      env {
        name  = "PORT"
        value = each.value.port
      }
    }
  }

  ingress {
    external_enabled = true
    target_port      = each.value.port
    traffic_weight {
      percentage      = 100
      latest_revision = true
    }
  }

  depends_on = [azurerm_container_app_environment.main]
}