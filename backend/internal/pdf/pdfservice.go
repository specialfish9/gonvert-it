package pdf

import (
	"archive/zip"
	"context"
	"fmt"
	"io"
	"mime/multipart"

	"github.com/pdfcpu/pdfcpu/pkg/api"
)

type Service interface {
	Split(ctx context.Context, file multipart.File, fileName string, w io.Writer) error
}

type serviceImpl struct {
}

func NewService() Service {
	return &serviceImpl{}
}

func (s *serviceImpl) Split(ctx context.Context, file multipart.File, fileName string, w io.Writer) error {
	spans, err := api.SplitRaw(file, 1, nil)
	if err != nil {
		return fmt.Errorf("pdf: failed to split PDF file: %w", err)
	}

	zipWriter := zip.NewWriter(w)
	defer zipWriter.Close()

	for i, file := range spans {
		err := addFileToZip(zipWriter, file, fmt.Sprintf("%s-%d.pdf", fileName, i+1))
		if err != nil {
			return fmt.Errorf("pdf: failed to add file to zip: %w", err)
		}
	}

	return nil
}

func addFileToZip(zipWriter *zip.Writer, span *api.PageSpan, spanName string) error {
	header := &zip.FileHeader{
		Name:   spanName,
		Method: zip.Deflate, // Compression method
	}

	writer, err := zipWriter.CreateHeader(header)
	if err != nil {
		return err
	}

	_, err = io.Copy(writer, span.Reader)
	return err
}
