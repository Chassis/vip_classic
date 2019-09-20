# Automattic VIP Classic Beta extension for Chassis
# lint:ignore: no-names_containing_dash-check
class vip_classic (
	$config,
	$php = $config[php],
	$path  = '/vagrant/extensions/vip_classic',
) {

	if ( ! empty( $config[disabled_extensions] ) and 'chassis/vip-classic' in $config[disabled_extensions] ) {
		$file = absent
	} else {
		$file = present
	}

	file { "${$path}/local-config.php":
		ensure  => $file,
		content => template('vip_classic/local-config.php.erb'),
		owner   => 'www-data',
		group   => 'www-data',
		mode    => '0644',
	}

	file { "${$path}/roles.php":
		ensure  => $file,
		content => template('vip_classic/roles.php.erb'),
		owner   => 'www-data',
		group   => 'www-data',
		mode    => '0644',
	}

	file { "${$path}/vip-config.php":
		ensure  => $file,
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
