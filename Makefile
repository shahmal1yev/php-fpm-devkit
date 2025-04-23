start:
	docker volume create fpms && docker compose build && docker compose up -d

init:
	cp .env.example .env
	cp conf/php.default.ini conf/php.ini
	cp conf/www.conf.default.template conf/www.conf.template
	cp conf/zz-docker.conf.default.template conf/zz-docker.conf.template

build:
	docker volume create fpms && docker compose build

up:
	docker compose up -d

down:
	docker compose down --remove-orphans

rebuild:
	docker compose down --remove-orphans && docker compose build --no-cache && docker compose up -d

logs:
	docker compose logs -f php

bash:
	docker compose exec php bash

