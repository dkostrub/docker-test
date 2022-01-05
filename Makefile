# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

# DOCKER TASKS
# Build the container
build: ## Build the container
# 	sudo chown -R prestaking ./docker/settings/mysql/data
	docker-compose build

run: ## Run container on port configured in `config.env`
	docker-compose up -d

up: build run ## Run container on port configured in `config.env` (Alias to run)

run_app: ## Run container
	docker-compose up -d $(NAME)

rebuild: ## Run container
# 	sudo chown -R prestaking ./docker/settings/mysql/data
	docker-compose up --build -d

stop: ## Stop and remove a running container
	docker-compose stop $(NAME); docker-compose rm $(NAME)

down: ## Stop and remove a running container
	docker-compose down

restart: ## Restart a running container
	docker-compose restart

login: ## Login a running container
	docker-compose exec $(NAME) bash

logs: ## SViews log a running container
	docker-compose logs -tail=100 -f $(NAME)

ps: ## View a running container
	docker-compose ps

clear: ## Clear all container
	docker stop $$(docker ps -a -q)
	docker rm $$(docker ps -a -q)
	docker volume rm $$(docker volume ls -f dangling=true -q)
	docker rmi -f $$(docker images -a -q)

network: ## View all network
	docker network ls