DB_USER=$(shell grep DB_USER .env | cut -d '=' -f 2)
DB_PASSWORD=$(shell grep DB_PASSWORD .env | cut -d '=' -f 2)
DB_HOST=$(shell grep DB_HOST .env | cut -d '=' -f 2)
DB_PORT=$(shell grep DB_PORT .env | cut -d '=' -f 2)
DB_NAME=$(shell grep DB_NAME .env | cut -d '=' -f 2)
DB_URL=postgres://$(DB_USER):$(DB_PASSWORD)@$(DB_HOST):$(DB_PORT)/$(DB_NAME)?sslmode=disable

migrate-up:
	go run -tags 'postgres' github.com/golang-migrate/migrate/v4/cmd/migrate -database "$(DB_URL)" -path database/migrations up

migrate-down:
	go run -tags 'postgres' github.com/golang-migrate/migrate/v4/cmd/migrate -database "$(DB_URL)" -path database/migrations down

seed:
	go run -mod=mod database/seeders/seeder.go
