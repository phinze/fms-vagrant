node default {
  class { 'flash_media_server':
    serial_number => $fms_serial
  }
}
