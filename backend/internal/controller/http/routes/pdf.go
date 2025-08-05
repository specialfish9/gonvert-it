package routes

import (
	"fmt"
	"gonvertit/internal/pdf"
	"gonvertit/internal/registry"
	"io"
	"net/http"

	"github.com/go-chi/chi/v5"
)

type pdfRouter struct {
	PDFService pdf.Service
}

func InitPdfRouter(baseRouter chi.Router, registry *registry.Registry) {
	r := &pdfRouter{
		PDFService: registry.PDFService,
	}

	baseRouter.Post("/pdf/split", r.split)
	baseRouter.Post("/pdf/merge", r.merge)
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

func (r *pdfRouter) merge(rw http.ResponseWriter, req *http.Request) {
	err := req.ParseMultipartForm(10 << 20) // 10MB
	if err != nil {
		error_handler(rw, err, http.StatusBadRequest)
		return
	}

	files := req.MultipartForm.File["files"]
	if len(files) == 0 {
		error_handler(rw, fmt.Errorf("no files provided"), http.StatusBadRequest)
		return
	}

	multipartFiles := make([]io.ReadSeeker, len(files))

	for i, fileHeader := range files {
		file, err := fileHeader.Open()
		if err != nil {
			error_handler(rw, fmt.Errorf("failed to open file %s: %w", fileHeader.Filename, err), http.StatusInternalServerError)
			return
		}
		defer file.Close()

		multipartFiles[i] = file
	}

	err = r.PDFService.Merge(req.Context(), multipartFiles, rw)
	if err != nil {
		error_handler(rw, fmt.Errorf("failed to merge PDF files: %w", err), http.StatusInternalServerError)
		return
	}
}
