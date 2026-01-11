resource "azurerm_backup_policy_vm_workload" "backup_policy_vm_workloads" {
  for_each = var.backup_policy_vm_workloads

  name                = each.value.name
  recovery_vault_name = each.value.recovery_vault_name
  resource_group_name = each.value.resource_group_name
  workload_type       = each.value.workload_type

  protection_policy {
    backup {
      frequency            = each.value.protection_policy.backup.frequency
      frequency_in_minutes = each.value.protection_policy.backup.frequency_in_minutes
      time                 = each.value.protection_policy.backup.time
      weekdays             = each.value.protection_policy.backup.weekdays
    }
    policy_type = each.value.protection_policy.policy_type
    dynamic "retention_daily" {
      for_each = each.value.protection_policy.retention_daily != null ? [each.value.protection_policy.retention_daily] : []
      content {
        count = retention_daily.value.count
      }
    }
    dynamic "retention_monthly" {
      for_each = each.value.protection_policy.retention_monthly != null ? [each.value.protection_policy.retention_monthly] : []
      content {
        count       = retention_monthly.value.count
        format_type = retention_monthly.value.format_type
        monthdays   = retention_monthly.value.monthdays
        weekdays    = retention_monthly.value.weekdays
        weeks       = retention_monthly.value.weeks
      }
    }
    dynamic "retention_weekly" {
      for_each = each.value.protection_policy.retention_weekly != null ? [each.value.protection_policy.retention_weekly] : []
      content {
        count    = retention_weekly.value.count
        weekdays = retention_weekly.value.weekdays
      }
    }
    dynamic "retention_yearly" {
      for_each = each.value.protection_policy.retention_yearly != null ? [each.value.protection_policy.retention_yearly] : []
      content {
        count       = retention_yearly.value.count
        format_type = retention_yearly.value.format_type
        monthdays   = retention_yearly.value.monthdays
        months      = retention_yearly.value.months
        weekdays    = retention_yearly.value.weekdays
        weeks       = retention_yearly.value.weeks
      }
    }
    dynamic "simple_retention" {
      for_each = each.value.protection_policy.simple_retention != null ? [each.value.protection_policy.simple_retention] : []
      content {
        count = simple_retention.value.count
      }
    }
  }

  settings {
    compression_enabled = each.value.settings.compression_enabled
    time_zone           = each.value.settings.time_zone
  }
}

