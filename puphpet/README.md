### Installed List

- Apache
- PHP 5.3 with Composer
- MySQL
- PostgreSQL

### Usage

Start
	
	vagrant up
	
Stop

	vagrant halt
	
Provision (Redo the setup)

	vagrant provision
	
Test and Browse

1. Put files to `./www` directory
2. Open browser

		http://localhost:8080/

### Other

- The `./www` directory will sync to `/home/vagrant/www`
- The document root is `/home/vagrant/www`
- Details in `./manifests/default.pp`
- MySQL username and password are `root`