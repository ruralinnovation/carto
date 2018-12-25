# Steps to run:

- create an ubuntu 16.04 ec2
-	edit `hosts` and change the IP to the public ip of the ec2
- edit `play.yml` and enter the public ip (or domain) and private host IP 
- run `ansible-playbook -i hosts play.yml`


## CartoDB Development

1. create user
	- ssh to instance
	- `cd cartodb`
	- `script/create_dev_user`
2. start carto
	- `cd ~`
	- `./carto-start.sh`

### Stoping Cartodb
`./carto-stop.sh`


## CartoDB Production

Manual steps:

1. Place ssl certificate and key in `/home/ubuntu/ssl`

2. Restart nginx: `sudo service nginx restart`

3. Create user
	- `cd cartodb`
	- `RAILS_ENV=production script/create_dev_user`

4. Start resque/windshaft/sqlapi
	- `cd ~`
	- `foreman start`