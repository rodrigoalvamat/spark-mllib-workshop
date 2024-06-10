MYPY_OPTIONS = --ignore-missing-imports --disallow-untyped-calls --disallow-untyped-defs --disallow-incomplete-defs

.PHONY: spark-up
spark-up:
	docker-compose up -d --scale spark-worker=3

.PHONY: spark-down
spark-down:
	docker-compose down

.PHONY: type-check
type-check:
	poetry run mypy ${MYPY_OPTIONS} data_transformations tests

.PHONY: requirements
requirements.txt:
	poetry export -f requirements.txt --output requirements.txt --dev