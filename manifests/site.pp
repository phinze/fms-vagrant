node default {
  unless $fms_serial {
    fail('please specify FMS_SERIAL as an environment variable to provision')
  }
  class { 'flash_media_server':
    serial_number => $fms_serial
  }
}
