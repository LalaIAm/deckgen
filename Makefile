.PHONY: help up down logs migrate shell-api

help:
	@echo "Available targets:"
	@echo "  make up        - Start all services in detached mode"
	@echo "  make down      - Stop and remove services"
	@echo "  make logs      - Tail service logs"
	@echo "  make migrate   - Run Alembic migrations in backend-api container"
	@echo "  make shell-api - Open bash shell in backend-api container"

up:
	docker-compose up -d

down:
	docker-compose down

logs:
	docker-compose logs -f

migrate:
	docker-compose exec backend-api alembic upgrade head

shell-api:
	docker-compose exec backend-api bash