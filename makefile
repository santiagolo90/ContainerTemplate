user = 1000
group = 1000
tools = tools.yaml

start:
	docker compose down --remove-orphans
	docker compose up -d
	docker compose logs -f
logs:
	docker compose logs -f 
stop:
	docker compose down 
run-prod:
	docker compose -f docker-compose-prod.yaml up angular
clean:
	docker image prune -a

angular:
	docker compose -f $(tools) run --rm -u $(user):$(group) frontend

nestjs:
	docker compose -f $(tools) run --rm -u $(user):$(group) nestjs

metrics:
	docker compose up -d prometheus
	docker compose up -d grafana	
	docker compose up -d mariadb
	docker compose up -d dotnet
	docker compose logs -f

dev:
	docker compose up -d mariadb
	docker compose up -d dotnet
	docker compose up -d nestjs
	docker compose up -d frontend
	docker compose logs -f
