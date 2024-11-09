.PHONY: all
all: start

.PHONY: start
start: stop
	docker-compose up -d --build

.PHONY: nocache
nocache: stop
	docker-compose build --no-cache
	docker-compose up -d

.PHONY: stop
stop:
	docker-compose down

.PHONY: clean
clean: stop
	docker volume rm pgdata
