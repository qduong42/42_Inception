## Inception


### Yaml files support:

- Maps
	- Key value, nested maps are possible

map
	value1
	value2
	nestedmap
		value1ofnested
		value2ofnested

- Lists declared with

Example:
	- list1
	- list2

Commands: netstat -ano
	- show all ports used and listening

- MariaDB
  - mysql -u root -p
  - SHOW DATABASES;
  - USE Name;
  - SHOW TABLES;
  - SELECT * FROM table_name;

- Questions
  - why  manually chown -R works in container but not in script or RUN/CMD from Dockerfile? It only changes that specific folder.
  - volume declared after run works better, but problem persists.
  - possible reasons
    - volumes take over container file permissions 
    - changing root directories parent owned folders.
		- WORKAROUND FOUND:
			- first change owner of parent folder
			- then change owner of child folder recursively

- Redis
  - docker exec -it redis redis-cli
    - ping
  - docker exec -it redis redis-cli monitor

- github
  - git config --global credential.helper wincred 