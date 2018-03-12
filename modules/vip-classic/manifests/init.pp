# Automattic VIP Classic Beta extension for Chassis
# lint:ignore: no-names_containing_dash-check
class vip-classic (
  $config,
  $php = $config[php],
  $path  = '/vagrant/extensions/vip-classic',
) {

  file { "${$path}/local-config.php":
    content => template('vip-classic/local-config.php.erb'),
    owner   => 'www-data',
    group   => 'www-data',
    mode    => '0644',
  }

  file { "${$path}/roles.php":
    content => template('vip-classic/roles.php.erb'),
    owner   => 'www-data',
    group   => 'www-data',
    mode    => '0644',
  }

  file { "${$path}/vip-config.php":
    content => template('vip-classic/vip-config.php.erb'),
    owner   => 'www-data',
    group   => 'www-data',
    mode    => '0644',
  }
  class {'vip-classic::plugins': }
  class {'vip-classic::php':
    require => Class['vip-classic'],
  }
}
