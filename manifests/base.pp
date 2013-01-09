
exec { 'apt-get update':
  path => ['/usr/bin'],
}

class { 'omeka':
  hostname => 'neatline.dev',
  rootdir  => '/vagrant',
  require  => Exec['apt-get update'],
  debug    => true,
}

omeka::gitplugin { 'NeatlineTime':
  url     => 'git://github.com/scholarslab/NeatlineTime.git',
  require => Class['Omeka'],
}

