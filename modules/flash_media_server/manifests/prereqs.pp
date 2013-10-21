class flash_media_server::prereqs {
  package { [
    'libcap2',
    'libnspr4',
    'unzip'
  ]:
    ensure => installed
  }

  file { '/lib/libcap.so.2':
    ensure => link,
    target => '/lib/x86_64-linux-gnu/libcap.so.2',
    owner  => 'root',
    group  => 'root',
  }
}
