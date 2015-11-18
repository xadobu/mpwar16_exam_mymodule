# Apache Server Puppet Config
	
class mymodule::apache_conf
{
	# APACHE
	class { 'apache': }

	apache::vhost { 'myMpwar.prod':
		port    => '80',
		docroot       => '/var/www/project',
	}

	apache::vhost { 'myMpwar.dev':
		port    => '80',
		docroot       => '/var/www/project',
	}

	# PHP
	include ::yum::repo::remi
	
	package { 'libzip-last':
		require => Yumrepo['remi']
	}

	class { '::yum::repo::remi_php56':
		require => Package['libzip-last']
	}

	class { 'php':
		version => 'latest',
		require => Yumrepo['remi-php56'],
	}

	# Create files
	file { '/var/www/myproject/index.php':
		ensure  => 'present',
		content  => "Hello World. Sistema operativo ${operatingsystem} ${operatingsystemrelease}",
		mode    => '0644',
	}

	file { '/var/www/myproject/info.php':
		ensure  => 'present',
		source => "puppet:///modules/mymodule/info.php",
		mode    => '0644',
	}
	
	# firewalld - Centos 7
	firewalld_rich_rule { 'Accept HTTP':
		ensure  => present,
		zone    => 'public',
		service => 'http',
		action  => 'accept',
	}
}