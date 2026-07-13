variable "backup_policy_vm_workloads" {
  description = <<EOT
Map of backup_policy_vm_workloads, attributes below
Required:
    - name
    - recovery_vault_name
    - resource_group_name
    - workload_type
    - protection_policy (block):
        - backup (required, block):
            - frequency (optional)
            - frequency_in_minutes (optional)
            - time (optional)
            - weekdays (optional)
        - policy_type (required)
        - retention_daily (optional, block):
            - count (required)
        - retention_monthly (optional, block):
            - count (required)
            - format_type (required)
            - monthdays (optional)
            - weekdays (optional)
            - weeks (optional)
        - retention_weekly (optional, block):
            - count (required)
            - weekdays (required)
        - retention_yearly (optional, block):
            - count (required)
            - format_type (required)
            - monthdays (optional)
            - months (required)
            - weekdays (optional)
            - weeks (optional)
        - simple_retention (optional, block):
            - count (required)
    - settings (block):
        - compression_enabled (optional)
        - time_zone (required)
EOT

  type = map(object({
    name                = string
    recovery_vault_name = string
    resource_group_name = string
    workload_type       = string
    protection_policy = list(object({
      backup = object({
        frequency            = optional(string)
        frequency_in_minutes = optional(number)
        time                 = optional(string)
        weekdays             = optional(set(string))
      })
      policy_type = string
      retention_daily = optional(object({
        count = number
      }))
      retention_monthly = optional(object({
        count       = number
        format_type = string
        monthdays   = optional(set(number))
        weekdays    = optional(set(string))
        weeks       = optional(set(string))
      }))
      retention_weekly = optional(object({
        count    = number
        weekdays = set(string)
      }))
      retention_yearly = optional(object({
        count       = number
        format_type = string
        monthdays   = optional(set(number))
        months      = set(string)
        weekdays    = optional(set(string))
        weeks       = optional(set(string))
      }))
      simple_retention = optional(object({
        count = number
      }))
    }))
    settings = object({
      compression_enabled = optional(bool)
      time_zone           = string
    })
  }))
  validation {
    condition = alltrue([
      for k, v in var.backup_policy_vm_workloads : (
        length(v.protection_policy) >= 1
      )
    ])
    error_message = "Each protection_policy list must contain at least 1 items"
  }
}

