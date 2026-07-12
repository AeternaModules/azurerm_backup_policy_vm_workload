output "backup_policy_vm_workloads_name" {
  description = "Map of name values across all backup_policy_vm_workloads, keyed the same as var.backup_policy_vm_workloads"
  value       = { for k, v in azurerm_backup_policy_vm_workload.backup_policy_vm_workloads : k => v.name }
}
output "backup_policy_vm_workloads_protection_policy" {
  description = "Map of protection_policy values across all backup_policy_vm_workloads, keyed the same as var.backup_policy_vm_workloads"
  value       = { for k, v in azurerm_backup_policy_vm_workload.backup_policy_vm_workloads : k => v.protection_policy }
}
output "backup_policy_vm_workloads_recovery_vault_name" {
  description = "Map of recovery_vault_name values across all backup_policy_vm_workloads, keyed the same as var.backup_policy_vm_workloads"
  value       = { for k, v in azurerm_backup_policy_vm_workload.backup_policy_vm_workloads : k => v.recovery_vault_name }
}
output "backup_policy_vm_workloads_resource_group_name" {
  description = "Map of resource_group_name values across all backup_policy_vm_workloads, keyed the same as var.backup_policy_vm_workloads"
  value       = { for k, v in azurerm_backup_policy_vm_workload.backup_policy_vm_workloads : k => v.resource_group_name }
}
output "backup_policy_vm_workloads_settings" {
  description = "Map of settings values across all backup_policy_vm_workloads, keyed the same as var.backup_policy_vm_workloads"
  value       = { for k, v in azurerm_backup_policy_vm_workload.backup_policy_vm_workloads : k => v.settings }
}
output "backup_policy_vm_workloads_workload_type" {
  description = "Map of workload_type values across all backup_policy_vm_workloads, keyed the same as var.backup_policy_vm_workloads"
  value       = { for k, v in azurerm_backup_policy_vm_workload.backup_policy_vm_workloads : k => v.workload_type }
}

