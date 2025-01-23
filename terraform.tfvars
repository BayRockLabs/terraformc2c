/*resource_group_name     = "tfResourceGroup"
location                = "East US"
acr_name                = "c2cacr"
acr_resource_group_name = "c2c-demo"
acr_login_server        = "c2cacr.azurecr.io"
acr_admin_username      = "c2cacr"
acr_admin_password      = "+ZIQpusAzJ7K4N5JrAxb/CQl+qFQXjqElGZhgD1Q/c+ACRDTs9wC"
dns_zone_name           = "tfc2cnew.com"

container_apps = [
  {
    name       = "frontend"
    image_name = "c2c-ui"
    image_tag  = "c4ab117"
    port       = 80
  },
  {
    name       = "backend"
    image_name = "c2c-service"
    image_tag  = "7933e11"
    port       = 8000
  },
  {
    name       = "authservice"
    image_name = "auth_service"
    image_tag  = "42cad00"
    port       = 8000
  },
  {
    name       = "brlc2cdocumentparser"
    image_name = "brl-c2c-document-parser"
    image_tag  = "0a2661b"
    port       = 8000
  }
]
*/