# Automattic VIP Classic Beta extension for Chassis
# lint:ignore: no-names_containing_dash-check
class vip_classic (
  $config,
  $php = $config[php],
  $path  = '/vagrant/extensions/vip_classic',
) {

  file { "${$path}/local-config.php":
    content => template('vip_classic/local-config.php.erb'),
    owner   => 'www-data',
    group   => 'www-data',
    mode    => '0644',
  }

  file { "${$path}/roles.php":
    content => template('vip_classic/roles.php.erb'),
    owner   => 'www-data',
    group   => 'www-data',
    mode    => '0644',
  }

  file { "${$path}/vip-config.php":
    content => template('vip_classic/vip-config.php.erb'),
    owner   => 'www-data',
    group   => 'www-data',
    mode    => '0644',
  }
  class {'vip_classic::plugins': }
  class {'vip_classic::php':
    require => Class['vip_classic'],
  }
}
