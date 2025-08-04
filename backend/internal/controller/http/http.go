package http

import (
	"gonvertit/config"
	"gonvertit/internal/controller/http/routes"
	"gonvertit/internal/registry"
	"log/slog"
	"net/http"

	"github.com/go-chi/chi/v5"
	"github.com/go-chi/chi/v5/middleware"
)

func Init(cfg *config.Config, registry *registry.Registry) {
	r := chi.NewRouter()

	r.Use(middleware.Logger)

	routes.InitPdfRouter(r, registry)

	slog.Info("Server running on port " + cfg.Port + "...")
	http.ListenAndServe(":"+cfg.Port, r)
}
