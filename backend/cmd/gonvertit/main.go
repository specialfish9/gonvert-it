package main

import (
	"gonvertit/config"
	"gonvertit/internal/controller/http"
	"gonvertit/internal/registry"
	"log/slog"
	"os"
)

func main() {
	cfg, err := config.NewConfig()
	if err != nil {
		slog.Error("Failed to load configuration", "error", err)
		os.Exit(1)
	}

	registry := registry.New(cfg)

	http.Init(cfg, registry)

}
