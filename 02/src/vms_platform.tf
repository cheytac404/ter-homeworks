### VM Web variables

variable "vm_web_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Image family for VM web"
}

variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "Name for VM web"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "Platform ID for VM web"
}

# Закомментированные переменные ресурсов
# variable "vm_web_cores" {
#   type        = number
#   default     = 2
#   description = "CPU cores for VM web"
# }

# variable "vm_web_memory" {
#   type        = number
#   default     = 1
#   description = "Memory in GB for VM web"
# }

# variable "vm_web_core_fraction" {
#   type        = number
#   default     = 5
#   description = "Core fraction for VM web"
# }

variable "vm_web_preemptible" {
  type        = bool
  default     = true
  description = "Preemptible flag for VM web"
}

variable "vm_web_nat" {
  type        = bool
  default     = true
  description = "NAT flag for VM web"
}

# Закомментированная переменная metadata
# variable "vm_web_serial_port_enable" {
#   type        = number
#   default     = 1
#   description = "Serial port enable for VM web"
# }

### VM DB variables

variable "vm_db_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Image family for VM DB"
}

variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "Name for VM DB"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "Platform ID for VM DB"
}

# Закомментированные переменные ресурсов
# variable "vm_db_cores" {
#   type        = number
#   default     = 2
#   description = "CPU cores for VM DB"
# }

# variable "vm_db_memory" {
#   type        = number
#   default     = 2
#   description = "Memory in GB for VM DB"
# }

# variable "vm_db_core_fraction" {
#   type        = number
#   default     = 20
#   description = "Core fraction for VM DB"
# }

variable "vm_db_preemptible" {
  type        = bool
  default     = true
  description = "Preemptible flag for VM DB"
}

variable "vm_db_nat" {
  type        = bool
  default     = true
  description = "NAT flag for VM DB"
}

# Закомментированная переменная metadata
# variable "vm_db_serial_port_enable" {
#   type        = number
#   default     = 1
#   description = "Serial port enable for VM DB"
# }

variable "vm_db_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "Zone for VM DB"
}

### New map variables

variable "vms_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
  }))
  default = {
    web = {
      cores         = 2
      memory        = 1
      core_fraction = 20
    }
    db = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
  }
  description = "Resources configuration for VMs"
}

variable "vm_metadata" {
  type = map(any)
  default = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIQQ73AxMD8Z6Ca83zrWn6XFLHmco0SL66pzTTKliYxK sergey@netology"
  }
  description = "Common metadata for all VMs"
}

variable "vm_allow_stopping_for_update" {
  type        = bool
  default     = true
  description = "Allow stopping instance for update"
}
