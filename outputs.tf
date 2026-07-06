output "backup_policy_vm_workloads" {
  description = "All backup_policy_vm_workload resources"
  value       = azurerm_backup_policy_vm_workload.backup_policy_vm_workloads
}
output "backup_policy_vm_workloads_name" {
  description = "List of name values across all backup_policy_vm_workloads"
  value       = [for k, v in azurerm_backup_policy_vm_workload.backup_policy_vm_workloads : v.name]
}
output "backup_policy_vm_workloads_protection_policy" {
  description = "List of protection_policy values across all backup_policy_vm_workloads"
  value       = [for k, v in azurerm_backup_policy_vm_workload.backup_policy_vm_workloads : v.protection_policy]
}
output "backup_policy_vm_workloads_recovery_vault_name" {
  description = "List of recovery_vault_name values across all backup_policy_vm_workloads"
  value       = [for k, v in azurerm_backup_policy_vm_workload.backup_policy_vm_workloads : v.recovery_vault_name]
}
output "backup_policy_vm_workloads_resource_group_name" {
  description = "List of resource_group_name values across all backup_policy_vm_workloads"
  value       = [for k, v in azurerm_backup_policy_vm_workload.backup_policy_vm_workloads : v.resource_group_name]
}
output "backup_policy_vm_workloads_settings" {
  description = "List of settings values across all backup_policy_vm_workloads"
  value       = [for k, v in azurerm_backup_policy_vm_workload.backup_policy_vm_workloads : v.settings]
}
output "backup_policy_vm_workloads_workload_type" {
  description = "List of workload_type values across all backup_policy_vm_workloads"
  value       = [for k, v in azurerm_backup_policy_vm_workload.backup_policy_vm_workloads : v.workload_type]
}

