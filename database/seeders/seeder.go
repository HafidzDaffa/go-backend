package main

import (
	"fmt"
	"log"
	"os"

	"go-backend-gym/internal/models"
	"github.com/google/uuid"
	"github.com/joho/godotenv"
	"golang.org/x/crypto/bcrypt"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

func main() {
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}

	dsn := fmt.Sprintf("host=%s user=%s password=%s dbname=%s port=%s sslmode=disable TimeZone=Asia/Shanghai",
		os.Getenv("DB_HOST"),
		os.Getenv("DB_USER"),
		os.Getenv("DB_PASSWORD"),
		os.Getenv("DB_NAME"),
		os.Getenv("DB_PORT"),
	)

	db, err := gorm.Open(postgres.Open(dsn), &gorm.Config{})
	if err != nil {
		log.Fatal("Failed to connect to database")
	}

	hashedPassword, err := bcrypt.GenerateFromPassword([]byte("12341234"), bcrypt.DefaultCost)
	if err != nil {
		log.Fatal("Failed to hash password")
	}

	admin := models.User{
		ID:       uuid.New(),
		Name:     "admin",
		Email:    "admin@admin.com",
		Password: string(hashedPassword),
	}

	if err := db.Create(&admin).Error; err != nil {
		log.Fatalf("could not create admin user: %v", err)
	}

	fmt.Println("Admin user created successfully")
}
