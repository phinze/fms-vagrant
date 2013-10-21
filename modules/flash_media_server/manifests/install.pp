class flash_media_server::install(
  $extracted_dir,
  $serial_number,
  $install_dir,
  $ports,
  $admin_port,
  $admin_username,
  $admin_password,
){
  $extracted_path = "/usr/local/src/flash_media_server/${extracted_dir}"

  user { 'fms':
    ensure => present,
    system => true
  } ->

  file { 'fms-installer-input':
    ensure  => present,
    path    => '/usr/local/src/flash_media_server/installFMS.input',
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    content => template('flash_media_server/installFMS.input.erb')
  } ->

  file { 'fms-installer-license':
    ensure  => absent,
    path    => "${extracted_path}/License.txt"
  } ->

  file { 'modified-fms-installer':
    path    => "${extracted_path}/installFMS",
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template('flash_media_server/installFMS.erb'),
  } ->

  exec { 'fms-installer':
    command   => 'cat ../installFMS.input | ./installFMS',
    cwd       => $extracted_path,
    logoutput => true,
    creates   => '/opt/adobe/fms/fmscore',
    require   => File['fms-installer-input']
  }
}
