class mymodule {
	include mymodule::apache_conf
	
	include mymodule::mysql_conf
	
	include mymodule::mongo_conf

	include mymodule::shared_conf
}