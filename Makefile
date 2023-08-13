postgres:
	docker run --name postgres_alpine -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:alpine

createdb:
	docker exec -it postgres_alpine createdb --username=root --owner=root simple_bank

dropdb:
	docker exec -it postgres_alpine dropdb simple_bank

migrate-up:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose up

migrate-down:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose down


.PHONY: postgres createdb dropdb migrate-up migrate-down