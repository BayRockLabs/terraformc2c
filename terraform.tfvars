resource_group_name     = "tfResourceGroup"
location                = "East US"
acr_name                = "c2cacr"
acr_resource_group_name = "c2c-demo"
acr_login_server        = "c2cacr.azurecr.io"
acr_admin_username      = "c2cacr"
acr_admin_password      = "+ZIQpusAzJ7K4N5JrAxb/CQl+qFQXjqElGZhgD1Q/c+ACRDTs9wC"
dns_zone_name           = "tfc2cnew.com"
postgresql_server_name                  = "c2c-demo-db"
postgresql_server_resource_group_name   = "c2c-demo"
postgresql_database_name                = "newc2ctfdb"

container_apps = [
  {
    name       = "frontend"
    image_name = "c2c-ui"
    image_tag  = "d8abcc5"
    port       = 80
  },
  {
    name       = "backend"
    image_name = "c2c-service"
    image_tag  = "97312c2"
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