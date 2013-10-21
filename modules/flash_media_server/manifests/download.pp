class flash_media_server::download(
  $url,
  $extracted_dir,
  $linux_filename
){
  $filename = inline_template('<%= url.split("/").last %>')

  file { '/usr/local/src/flash_media_server':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755'
  } ->

  exec { 'download-flash_media_server':
    timeout => 0,
    command => "wget ${url}",
    cwd     => '/vagrant',
    creates => "/vagrant/${filename}"
  } ->

  file { 'link-flash_media_server':
    ensure => link,
    path   => "/usr/local/src/flash_media_server/${filename}",
    target => "/vagrant/${filename}"
  } ->

  exec { 'extract-flash_media_server':
    command => "unzip ${filename}",
    cwd     => '/usr/local/src/flash_media_server',
    creates => '/usr/local/src/flash_media_server/linux',
  } ->

  exec { 'extract-flash_media_server_linux':
    command => "tar xf linux/${linux_filename}",
    cwd     => '/usr/local/src/flash_media_server',
    creates => "/usr/local/src/flash_media_server/${extracted_dir}",
  }
}

