#1. Cuenta de almacenamiento
resource "azurerm_storage_account" "saccount"{
    name                = "sa${var.project}${var.environment}"
    resource_group_name = azurerm_resource_group.rg.name
    location = var.location
    account_tier = "Standard"
    account_replication_type = "LRS"
    tags = var.tags
}

resource "azurerm_storage_container" "contenedorarchivos" {
    name = "contenedorarchivos"
    container_access_type = "private"
    storage_account_id = azurerm_storage_account.saccount.id
}

//vamos a crear una cola de mensajes
resource "azurerm_storage_queue" "q1" {
    name = "background-tasks"
    storage_account_name = azurerm_storage_account.saccount.name
}

//Contenedor solo para guardar el estado de terraform y compartirlo:
//Esto nos permimtirá acceder desde otros repositorios
resource "azurerm_storage_container" "tfstate" {
    name                  = "tfstate"
    storage_account_id = azurerm_storage_account.saccount.id
    container_access_type = "private"
}