data "yandex_compute_image" "storage_os" {
  family = var.storage_vm_image_family
}


resource "yandex_compute_disk" "disk" {
  count = var.disk_count

  name = "disk-${count.index}"
  type = var.disk_type
  zone = var.disk_zone
  size = var.disk_size_gb
}


resource "yandex_compute_instance" "storage" {
  name                      = var.storage_vm_name
  platform_id               = var.storage_vm_platform_id
  zone                      = var.storage_vm_zone
  allow_stopping_for_update = var.storage_vm_allow_stopping

  resources {
    cores  = var.storage_vm_cores
    memory = var.storage_vm_memory_gb
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.storage_os.image_id
      size     = var.storage_vm_boot_disk_size_gb
    }
  }

   dynamic "secondary_disk" {
    for_each = { for idx, disk in yandex_compute_disk.disk : idx => disk.id }
    content {
      disk_id = secondary_disk.value
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "sergey:${local.ssh-keys}"
  }
}
