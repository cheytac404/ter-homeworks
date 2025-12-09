resource "yandex_compute_disk" "disk" {
  count = 3

  name = "disk-${count.index}"
  type = "network-hdd"
  zone = "ru-central1-a"
  size = 1 
}


resource "yandex_compute_instance" "storage" {
  name                      = "storage"
  platform_id               = "standard-v3"
  zone                      = "ru-central1-a"
  allow_stopping_for_update = true

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8g64rcu9fq5kpfqls0"  # Ubuntu 20.04
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
