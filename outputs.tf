output "resource_group_name"{
    value = azurerm_resource_group.rg.name
}

output "storage_account_name"{
    value = azurerm_storage_account.saccount.name
}

output "storage_account_access_key"{
    value = azurerm_storage_account.saccount.primary_access_key
    sensitive = true
}

output "queue_name"{
    value = azurerm_storage_queue.q1.name
}