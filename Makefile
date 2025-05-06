.PHONY: go swagger js

all:
	docker-compose up

go:
	docker-compose run --rm platform-api-go

swagger:
	docker-compose run --rm platform-api-swagger
