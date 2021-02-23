PHP_EXEC := docker-compose exec -T php
TARGET := alma-test-technique
 
build:
	docker build -t $(TARGET) .

start:
	docker-compose up -d
 
composer:
	$(PHP_EXEC) composer install
 
database:
	$(PHP_EXEC) bin/console doctrine:schema:update
 
test: unit-test functional-test

unit-test:
	$(PHP_EXEC) bin/phpunit

functional-test:
	$(PHP_EXEC) bin/phpunit

stop:
	docker-compose down --volumes