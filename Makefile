name = inception
all: build

build:
	@echo "Building configuration ${name}...\n"
	@bash srcs/requirements/wordpress/tools/make_dir.sh
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up --build

down:
	@echo "Stopping configuration ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env down

re:
	@echo "Rebuild configuration ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

clean: down
	@echo "Cleaning configuration ${name}...\n"
	@docker system prune -a
	@sudo rm -rf ~/data/wordpress/*
	@sudo rm -rf ~/data/mariadb/*

# be careful! fclean  cleans all your images!
fclean:
	@echo "Total clean of all configurations docker\n"
	@sudo rm -rf ~/data/*
	@docker stop $$(docker ps -qa)
	@docker rm $$(docker ps -qa)
	@docker volume rm $$(docker volume ls -q)
	@docker rmi -f $$(docker images -qa)

.PHONY	: all build down re clean fclean