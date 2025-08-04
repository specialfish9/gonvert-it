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
	if err != nil {
		return nil, fmt.Errorf("config: failed to load .env file: %w", err)
	}

	return &Config{
		Port: os.Getenv("PORT"),
	}, nil
}
