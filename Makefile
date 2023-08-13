postgres:
	docker run --name postgres_alpine -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:alpine

createdb:
	docker exec -it postgres_alpine createdb --username=root --owner=root simple_bank

dropdb:
	docker exec -it postgres_alpine dropdb simple_bank

.PHONY: postgres createdb dropdb