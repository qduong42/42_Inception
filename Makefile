#start your docker compose defined resoureces in detached mode
up:
	docker-compose -f srcs/docker-compose.yml up
# -d -f docker-compose.yml - detached in background

#stop all docker compose resources

stop:
	docker-compose -f srcs/docker-compose.yml stop

#destroy all docker compose resources
down:
	docker-compose -f srcs/docker-compose.yml down

clean:
	docker stop $$(docker ps -qa)
	docker rm $$(docker ps -qa)
	docker rmi -f $$(docker images -qa) # 2 dollar signs also execute commands inside as well as outside.
	docker volume rm $$(docker volume ls -q)
	docker network rm $$(docker network ls -q) 2>/dev/null

.Phony: up stop down clean all
