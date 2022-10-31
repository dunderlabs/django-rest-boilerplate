# If the first argument is "test"...
ifeq (test,$(firstword $(MAKECMDGOALS)))
  # use the rest as arguments for "test"
  PYTEST_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  # ...and turn them into do-nothing targets
  $(eval $(PYTEST_ARGS):;@:)
endif

test:
	$(MAKE) docker-compose-run cmd="pytest $(PYTEST_ARGS)"

unit-tests:
	$(MAKE) docker-compose-run cmd="pytest tests/unit/"

integration-tests:
	$(MAKE) docker-compose-run cmd="pytest tests/integration/"

test-all:
	$(MAKE) docker-compose-run cmd="pytest"
