package routes

import (
	"encoding/json"
	"log/slog"
	"net/http"
)

type jsonError struct {
	Message string `json:"message"`
	Code    int    `json:"code"`
}

func error_handler(rw http.ResponseWriter, err error, status int) {
	slog.Error("Error occurred", "error", err, "status", status)

	rw.Header().Set("Content-Type", "application/json")
	rw.WriteHeader(status)
	response := jsonError{
		Message: err.Error(),
		Code:    status,
	}
	if err := json.NewEncoder(rw).Encode(response); err != nil {
		slog.Error("Failed to encode error response", "error", err)
		// If encoding fails, we still want to send a plain text error response
		http.Error(rw, "Internal Server Error", http.StatusInternalServerError)
		return
	}
}
