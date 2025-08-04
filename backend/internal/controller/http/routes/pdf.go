package routes

import (
	"fmt"
	"gonvertit/internal/pdf"
	"gonvertit/internal/registry"
	"net/http"

	"github.com/go-chi/chi/v5"
)

type pdfRouter struct {
	PDFService pdf.Service
}

func InitPdfRouter(baseRouter *chi.Mux, registry *registry.Registry) {
	r := &pdfRouter{
		PDFService: registry.PDFService,
	}
	baseRouter.Post("/pdf/split", r.split)

}

func (r *pdfRouter) split(rw http.ResponseWriter, req *http.Request) {
	err := req.ParseMultipartForm(10 << 20) // 10MB
	if err != nil {
		error_handler(rw, err, http.StatusBadRequest)
		return
	}

	// Retrieve the file from form data
	file, header, err := req.FormFile("file")
	if err != nil {
		error_handler(rw, err, http.StatusBadRequest)
		return
	}
	defer file.Close()

	err = r.PDFService.Split(req.Context(), file, header.Filename, rw)
	if err != nil {
		error_handler(rw, fmt.Errorf("failed to split PDF file: %w", err), http.StatusInternalServerError)
		return
	}
}
