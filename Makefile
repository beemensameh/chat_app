docker-build:
	docker-compose build

docker-up:
	docker-compose up

docker-down:
	docker-compose down

docker-refresh:
	docker-compose down
	docker-compose build
	docker-compose up
