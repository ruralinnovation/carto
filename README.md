# Steps to run:

- create an ubuntu 16.04 ec2
-	edit `hosts` and change the IP to the public ip of the ec2
- edit `play.yml` and enter the public ip (or domain) 
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

1. Place real ssl certificate.pem and key.pem in `/home/ubuntu/ssl`
```
sudo apt-get update
sudo apt-get install software-properties-common
sudo add-apt-repository universe
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
sudo apt-get install python-certbot-nginx 

sudo certbot --nginx certonly
```
See https://certbot.eff.org/lets-encrypt/ubuntuxenial-nginx

```
sudo cp /etc/letsencrypt/live/fmcarto.ruralinnovation.us/fullchain.pem /home/ubuntu/ssl/certificate.pem
sudo cp /etc/letsencrypt/live/fmcarto.ruralinnovation.us/privkey.pem /home/ubuntu/ssl/key.pem
```

2. Restart nginx: `sudo service nginx restart`

3. Create user
	- `cd cartodb`
	- `RAILS_ENV=production script/create_dev_user`

### Resque/Windshaft/SQL API

These services are managed by systemd:

- Resque: 
	- `sudo systemctl status resque`
	- `sudo systemctl start resque`
	- `sudo systemctl stop resque`

- Windshaft: 
	- `sudo systemctl status carto-windshaft`
	- `sudo systemctl start carto-windshaft`
	- `sudo systemctl stop carto-windshaft`

- SQL API: 
	- `sudo systemctl status carto-sqlapi`
	- `sudo systemctl start carto-sqlapi`
	- `sudo systemctl stop carto-sqlapi`
	
- nginx:
	- `sudo systemctl status nginx`
	- `sudo systemctl start nginx`
	- `sudo systemctl stop nginx`
	
- postgresql:
	- `sudo systemctl status postgresql`
	- `sudo systemctl start postgresql`
	- `sudo systemctl stop postgresql`
