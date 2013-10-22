class flash_media_server(
  $serial_number       = '',
  $install_dir         = '/opt/adobe/fms',
  $ports               = '1935,80',
  $admin_port          = '1111',
  $admin_username      = 'fmsadmin',
  $admin_password      = 'adminadmin',
  $url                 = 'https://dl.dropboxusercontent.com/u/12210925/dist/FlashMediaDevServer_4_5_all.zip',
  $extracted_dir       = 'FMS_4_5_0_r297',
  $linux_filename      = 'FlashMediaServer4.5_x64.tar.gz',
) {
  include flash_media_server::prereqs
  class { 'flash_media_server::download':
    url            => $url,
    extracted_dir  => $extracted_dir,
    linux_filename => $linux_filename
  }
  class { 'flash_media_server::install':
    extracted_dir  => $extracted_dir,
    serial_number  => $serial_number,
    install_dir    => $install_dir,
    ports          => $ports,
    admin_port     => $admin_port,
    admin_username => $admin_username,
    admin_password => $admin_password,
  }

  Class['flash_media_server::prereqs'] ->
    Class['flash_media_server::download'] ->
    Class['flash_media_server::install']

  Exec { path => [ '/usr/local/bin', '/usr/local/sbin', '/usr/bin', '/usr/sbin', '/bin', '/sbin' ] }
}
