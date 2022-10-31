build:
	$(MAKE) docker-compose-cmd cmd="build"

rebuild:
	$(MAKE) docker-compose-cmd cmd="build --no-cache"

pull:
	$(MAKE) docker-compose-cmd cmd="pull"

up:
	$(MAKE) docker-compose-cmd cmd="up --remove-orphans"

down:
	$(MAKE) docker-compose-cmd cmd="down"

image-build:
	docker build $(image-name) .

run:
	$(MAKE) docker-compose-cmd cmd="run --service-ports --use-aliases --rm backend python manage.py runserver_plus 0.0.0.0:8000 --nopin"

stop:
	$(MAKE) docker-compose-cmd cmd="down $(args) --remove-orphans"
