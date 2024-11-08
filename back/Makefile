.PHONY: all
all: start

.PHONY: start
start: stop
	docker-compose up -d

.PHONY: stop
stop:
	docker-compose down

.PHONY: clean
clean:
