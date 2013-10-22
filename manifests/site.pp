node default {
  exec { '/usr/bin/apt-get update':
  } ->
  class { 'flash_media_server':
    serial_number => $fms_serial
  }
}
