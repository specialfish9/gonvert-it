package config

import (
	"fmt"
	"os"

	"github.com/joho/godotenv"
)

type Config struct {
	Port string
}

func NewConfig() (*Config, error) {
	err := godotenv.Load()
	if err != nil && !os.IsNotExist(err) {
		return nil, fmt.Errorf("config: failed to load .env file: %w", err)
	}

	return &Config{
		Port: orElse(os.Getenv("PORT"), "8080"),
	}, nil
}

func orElse(value, defaultValue string) string {
	if value == "" {
		return defaultValue
	}
	return value
}
