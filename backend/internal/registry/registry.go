package registry

import (
	"gonvertit/config"
	"gonvertit/internal/pdf"
)

type Registry struct {
	PDFService pdf.Service
}

func New(cfg *config.Config) *Registry {

	return &Registry{
		PDFService: pdf.NewService(),
	}
}
