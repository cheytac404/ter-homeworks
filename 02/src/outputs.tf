output "vm_web_info" {
  description = "Information about VM Web"
  value = {
    instance_name = yandex_compute_instance.platform.name
    external_ip   = yandex_compute_instance.platform.network_interface[0].nat_ip_address
    fqdn          = yandex_compute_instance.platform.fqdn
  }
}

output "vm_db_info" {
  description = "Information about VM DB"
  value = {
    instance_name = yandex_compute_instance.platform_db.name
    external_ip   = yandex_compute_instance.platform_db.network_interface[0].nat_ip_address
    fqdn          = yandex_compute_instance.platform_db.fqdn
  }
}

# Добавляем output для local-переменных (для проверки)
output "local_names" {
  description = "Local variable values"
  value = {
    vm_web_name = local.vm_web_name
    vm_db_name  = local.vm_db_name
  }
}
