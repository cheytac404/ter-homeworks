###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}
variable "vm_count" {
  description = "количество создаваемых виртуальных машин (для count)"
  type        = number
  default     = 2
}

variable "vm_platform_id" {
  description = "nип аппаратной платформы для ВМ"
  type        = string
  default     = "standard-v1"
}

variable "vm_cores" {
  description = "Количество vCPU"
  type        = number
  default     = 2
}

variable "vm_memory" {
  description = "Объём RAM"
  type        = number
  default     = 1
}

variable "vm_core_fraction" {
  description = "vCPU (%)"
  type        = number
  default     = 5
}

variable "vm_image_family" {
  description = "cемейство образов"
  type        = string
  default     = "ubuntu-2004-lts"
}

variable "vm_preemptible" {
  description = "прерываемые ВМ"
  type        = bool
  default     = true
}
variable "disk_count" {
  description = "Количество создаваемых дисков"
  type        = number
  default     = 3
}

variable "disk_properties" {
  description = "Общие свойства"
  type = object({
    type = string
    zone = string
    size = number
  })
  default = {
    type = "network-hdd"
    zone = "ru-central1-a"
    size = 1
  }
}

variable "storage_vm" {
  description = "storage"
  type = object({
    name                      = string
    platform_id               = string
    zone                      = string
    allow_stopping_for_update = bool
    cores                     = number
    memory                    = number
    image_family              = string
    boot_disk_size            = number
  })
  default = {
    name                      = "storage"
    platform_id               = "standard-v3"
    zone                      = "ru-central1-a"
    allow_stopping_for_update = true
    cores                     = 2
    memory                    = 2
    image_family              = "ubuntu-2004-lts"
    boot_disk_size            = 10
  }
}
variable "disk_type" {
  description = "Тип дополнительных дисков"
  type        = string
  default     = "network-hdd"
}

variable "disk_zone" {
  description = "Зона для дополнительных дисков"
  type        = string
  default     = "ru-central1-a"
}

variable "disk_size_gb" {
  description = "Размер каждого дополнительного диска в ГБ"
  type        = number
  default     = 1
}

# Простые переменные для ВМ storage (в дополнение к существующему storage_vm)
variable "storage_vm_name" {
  description = "Имя виртуальной машины storage"
  type        = string
  default     = "storage"
}

variable "storage_vm_platform_id" {
  description = "Тип платформы для ВМ storage"
  type        = string
  default     = "standard-v3"
}

variable "storage_vm_zone" {
  description = "Зона для ВМ storage"
  type        = string
  default     = "ru-central1-a"
}

variable "storage_vm_cores" {
  description = "Количество vCPU для ВМ storage"
  type        = number
  default     = 2
}

variable "storage_vm_memory_gb" {
  description = "Объем RAM для ВМ storage в ГБ"
  type        = number
  default     = 2
}

variable "storage_vm_image_family" {
  description = "Семейство образов ОС для ВМ storage"
  type        = string
  default     = "ubuntu-2004-lts"
}

variable "storage_vm_boot_disk_size_gb" {
  description = "Размер загрузочного диска ВМ storage в ГБ"
  type        = number
  default     = 10
}

variable "storage_vm_allow_stopping" {
  description = "Разрешить остановку ВМ для обновления"
  type        = bool
  default     = true
}
