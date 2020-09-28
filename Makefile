include .env

.PHONY: install

start: docker/up install

docker/up:
	@(docker-compose up -d)
	@(docker-compose run wait)

docker/down:
	@(docker-compose down)

install:
	@(MAKE core/install)
	@(MAKE theme/install)
	@(MAKE plugin/delete)
	@(MAKE theme/delete)
	@(MAKE plugin/install)
	@(MAKE plugin/activate)
	@(MAKE wp-db/update)


translate:
	@(MAKE plugin/translate)
	@(MAKE core/translate)

core/install:
	docker exec wordpress wp core install --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_USER} --admin_password=${WP_PASSWORD} --admin_email=${WP_EMAIL}

core/translate:
	docker exec wordpress wp language core install pt_BR --activate

plugin/install:
	docker exec wordpress wp plugin install contact-form-7

plugin/delete:
	docker exec wordpress wp plugin delete akismet hello

plugin/translate:
	docker exec wordpress wp language plugin install pt_BR --all

plugin/activate:
	docker exec wordpress wp plugin activate contact-form-7

plugin/update:
	docker exec wordpress wp plugin update --all

theme/delete:
	docker exec wordpress wp theme delete twentyseventeen twentynineteen 

theme/install:
	docker exec wordpress wp theme install twentytwenty --activate

wp-db/update:
	docker exec wordpress wp core update-db

