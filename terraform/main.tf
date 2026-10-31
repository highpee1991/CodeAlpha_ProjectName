resource "random_string" "suffix" {
  length  = 6
  upper = false
  special = false
  numeric = true
}


resource "azurerm_resource_group" "main" {
    name     = "rg-${var.project_name}-${var.environment}"
    location = var.location


    tags = {
        Project = var.project_name
        Environment = var.environment
        managedBy = "Terraform"


    }
}


resource "azurerm_container_registry" "main" {
    name                = "acr${var.project_name}${random_string.suffix.result}"
    resource_group_name = azurerm_resource_group.main.name
    location            = azurerm_resource_group.main.location
    sku                 = "Basic"
    admin_enabled       = false

    tags = {
        Project = var.project_name
        Environment = var.environment
        managedBy = "Terraform"
    }
}


resource "azurerm_service_plan" "main" {
    name                = "asp-${var.project_name}-${var.environment}"
    location            = azurerm_resource_group.main.location
    resource_group_name = azurerm_resource_group.main.name
    kind                = "Linux"
    reserved            = true

    os_type = "Linux"
    sku_name = var.app_service_plan_sku

    tags = {
        Project = var.project_name
        Environment = var.environment
        managedBy = "Terraform"
    }
}


resource "azurerm_linux_web_app" "main" {
    name                = "app-${var.project_name}-${random_string.suffix.result}"
    location            = azurerm_resource_group.main.location
    resource_group_name = azurerm_resource_group.main.name
    service_plan_id     = azurerm_service_plan.main.id

    https_only = true

    identity {
        type = "SystemAssigned"
    }

    site_config {
        always_on = true

        container_registry_use_managed_identity = true

        application_stack {
            docker_image_name = "${var.container_image_name}:${var.container_image_tag}"
            docker_registry_url = "https://${azurerm_container_registry.main.login_server}"
        }
    }

    

    app_settings = {
        WEBSITE_PORT      = "3000"
        WEBSITE_ENABLE_APP_SERVICE_STORAGE = "false"
        APP_ENV = var.environment
        APP_VERSION = "1.0.0"
    }

    tags = {
        Project = var.project_name
        Environment = var.environment
        managedBy = "Terraform"
    }
}

resource "azurerm_role_assignment" "acr_pull" {
    scope                = azurerm_container_registry.main.id
    role_definition_name = "AcrPull"
    principal_id         = azurerm_linux_web_app.main.identity[0].principal_id

    skip_service_principal_aad_check = true
}


