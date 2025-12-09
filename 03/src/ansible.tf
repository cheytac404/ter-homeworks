locals {

  webservers = [
    for vm in yandex_compute_instance.count : {
      name        = vm.name
      fqdn        = vm.fqdn
      external_ip = vm.network_interface[0].nat_ip_address
    }
  ]


  databases = [
    for vm in yandex_compute_instance.for_each : {
      name        = vm.name
      fqdn        = vm.fqdn
      external_ip = vm.network_interface[0].nat_ip_address
    }
  ]


  storage = [
    {
      name        = yandex_compute_instance.storage.name
      fqdn        = yandex_compute_instance.storage.fqdn
      external_ip = yandex_compute_instance.storage.network_interface[0].nat_ip_address
    }
  ]
}


resource "local_file" "hosts_cfg" {
  content = templatefile("${path.module}/hosts.tftpl",
    {
      webservers = local.webservers
      databases  = local.databases
      storage    = local.storage
    }
  )
  filename = "${abspath(path.module)}/hosts.cfg"
}
