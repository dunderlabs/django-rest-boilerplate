docker-compose-cmd:
	docker-compose $(cmd)

# Docker-Compose run
docker-compose-run:
	$(MAKE) docker-compose-cmd cmd="run --rm backend $(cmd)"

poetry-install:
	$(MAKE) docker-compose-cmd cmd="poetry install"

# If the first argument is "poetry-add"...
ifeq (poetry-add,$(firstword $(MAKECMDGOALS)))
  # use the rest as arguments for "poetry-add"
  POETRY_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  # ...and turn them into do-nothing targets
  $(eval $(POETRY_ARGS):;@:)
endif

poetry-add:
	$(MAKE) docker-compose-cmd cmd="poetry add $(POETRY_ARGS)"

poetry-update:
	$(MAKE) docker-compose-cmd cmd="poetry update"
