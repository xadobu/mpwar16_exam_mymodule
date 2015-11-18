# Apache Server Puppet Config
	
class mymodule::shared_conf
{
	# Ensure Time Zone and Region.
	class { 'timezone':
		timezone => 'Europe/Madrid',
	}

	# NTP
	class { '::ntp':
		server => [ '1.es.pool.ntp.org', '2.europe.pool.ntp.org', '3.europe.pool.ntp.org' ],
	}
}