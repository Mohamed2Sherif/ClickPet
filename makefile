COMPOSE_FILE := compose_local.yml

start:
	@docker-compose -f $(COMPOSE_FILE) up -d --build

stop:
	@docker-compose -f $(COMPOSE_FILE) down

restart: stop start

logs:
	@docker-compose -f $(COMPOSE_FILE) logs -f

push:
	git push && git push --tags