# MySQL Puppet Config

class mymodule::mysql_conf
{
	# MySQL
	class { '::mysql::server':
		root_password    => 'vagrantpass',
	}

	mysql::db { 'mpwar_test':
		user     => 'mpwardb',
		password => 'mpwardb',
	}

	mysql::db { 'mympwar':
		user     => 'mpwardb',
		password => 'mpwardb',
	}
}