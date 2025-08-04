package routes

import (
	"log/slog"
	"net/http"
)

func error_handler(rw http.ResponseWriter, err error, status int) {
	slog.Error("Error occurred", "error", err, "status", status)
	http.Error(rw, err.Error(), status)
}
