up: docker-compose up -d

build: docker-compose build

test: docker-compose run --rm test

down: docker-compose down

.PHONY: up build test down