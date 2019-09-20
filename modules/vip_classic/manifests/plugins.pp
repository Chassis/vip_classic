# Automattic VIP Classic Beta extension for Chassis
# lint:ignore: no-names_containing_dash-check
class vip_classic::plugins (
  $path  = '/vagrant/extensions/vip_classic',
		$github_plugins = {
				'themes/vip/plugins' => 'svn2github/wordpress-vip-plugins',
				'mu-plugins' => 'automattic/vip-wpcom-mu-plugins',
		}
) {
		if ( ! empty( $::config[disabled_extensions] ) and 'chassis/vip-classic' in $::config[disabled_extensions] ) {
				$directory = absent
		} else {
				$directory = directory
		}

		# We'll always want this directory.
		if ! ( File['/vagrant/content'] ) {
				file { '/vagrant/content':
					ensure => directory,
				}
		}

		file { '/vagrant/content/themes/vip':
			ensure  => $directory,
			recurse => true,
			force   => true
		}

		file { '/vagrant/content/mu-plugins':
			ensure  => $directory,
			recurse => true,
			force   => true
		}

		if ( $directory == directory ) {
				exec { 'vip-plugins-install':
					command => 'git clone --recursive https://github.com/svn2github/wordpress-vip-plugins.git /vagrant/content/themes/vip/plugins',
					path    => [ '/usr/bin/', '/bin' ],
					require => Package[ 'git-core' ],
					onlyif  => 'test ! -d /vagrant/content/themes/vip/plugins',
					timeout => 0
				}

				exec { 'vip-plugins-plugins-update':
					command => 'git --work-tree=/vagrant/content/themes/vip/plugins --git-dir=/vagrant/content/themes/vip/plugins/.git pull origin master',
					path    => [ '/usr/bin/', '/bin' ],
					require => [ Package[ 'git-core' ] ],
					onlyif  => 'test -d /vagrant/content/themes/vip/plugins/.git',
					timeout => 0
				}

				exec { 'mu-plugins-install':
					command => 'git clone --recursive https://github.com/automattic/vip-wpcom-mu-plugins.git /vagrant/content/mu-plugins',
					path    => [ '/usr/bin/', '/bin' ],
					require => Package[ 'git-core' ],
					onlyif  => 'test ! -d /vagrant/content/mu-plugins',
					timeout => 0
				}

				exec { 'mu-plugins-update':
					command => 'git --work-tree=/vagrant/content/mu-plugins --git-dir=/vagrant/content/mu-plugins/.git pull origin master',
					path    => [ '/usr/bin/', '/bin' ],
					require => [ Package[ 'git-core' ] ],
					onlyif  => 'test -d /vagrant/content/mu-plugins/.git',
					timeout => 0
				}
		}

}
