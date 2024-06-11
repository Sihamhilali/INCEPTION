up: 
	@mkdir -p /home/selhilal/data/mariadb
	@mkdir -p /home/selhilal/data/wordpress
	docker-compose -f ./srcs/docker-compose.yml up -d

build: 
	docker-compose -f ./srcs/docker-compose.yml build

test: 
	docker-compose -f ./srcs/docker-compose.yml run --rm test

down: 
	docker-compose  -f ./srcs/docker-compose.yml down

clean: 
	docker-compose -f ./srcs/docker-compose.yml down --volumes --rmi all
	rm -rf /home/selhilal/data/mariadb
	rm -rf /home/selhilal/data/wordpress

