## CARTODB

Steps to run:

- create an ubuntu 16.04 ec2
-	edit `hosts` and change the IP to the public ip of the ec2
- edit `play.yml` and enter the public and private host IPs 
- run `ansible-playbook -i hosts play.yml`


Manual steps:

1. create user
	- ssh to instance
	- `cd cartodb`
	- `script/create_dev_user`
2. start carto
	- `cd ~`
	- `./carto-start.sh`

### Stoping Cartodb
`./carto-stop.sh`