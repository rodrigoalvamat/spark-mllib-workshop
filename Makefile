.PHONY: spark-up
spark-up:
	docker-compose up -d --scale spark-worker=3

.PHONY: spark-down
spark-down:
	docker-compose down