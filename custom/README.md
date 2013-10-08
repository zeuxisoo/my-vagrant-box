### Installed List

- Apache
- PHP 5.3.10 with Composer
- MySQL 5.5

### Usage

Start
	
	vagrant up
	
Stop

	vagrant halt
	
Provision (Redo the scripts)

	vagrant provision
	
Test and Browse

1. Put files to `./www` directory
2. Open browser

		http://localhost:8080/

### Other

- The `./www` directory will sync to `/home/vagrant/www`
- The document root is `/home/vagrant/www`
- Settings in files
- MySQL username and password are `root`