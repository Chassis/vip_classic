# Automattic VIP Classic Beta extension for Chassis
class vip::plugins (
  $path  = '/vagrant/extensions/vip-classic',

  $github_plugins = {
    'themes/vip/plugins' => 'svn2github/wordpress-vip-plugins',
    'mu-plugins' => 'automattic/vip-wpcom-mu-plugins',
  }
) {
  if ! ( File['/vagrant/content'] ) {
    file { '/vagrant/content':
      ensure => 'directory',
    }
  }

  if ! ( File['/vagrant/content/themes/vip'] ) {
    file { '/vagrant/content/themes/vip':
      ensure => 'directory',
    }
  }

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
