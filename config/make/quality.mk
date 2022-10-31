# Quality
black:
	$(MAKE) docker-compose-run cmd="black ."

black-check:
	$(MAKE) docker-compose-run cmd="black --check ."

mypy-check:
	$(MAKE) docker-compose-cmd cmd="run --rm mypy"
