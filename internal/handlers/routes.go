package handlers

import (
	"net/http"
	"time"

	"github.com/VladimirSharipov/auth/internal/database/pgsql"
	"github.com/go-chi/chi/v5"
)

func SetupRoutes(storage *pgsql.DB, ownKey string, tokenTTL time.Duration) http.Handler {
	r := chi.NewRouter()

	r.Get("/access", AccessHandler(storage, ownKey, tokenTTL))
	r.Post("/refresh", RefreshHandler(storage, ownKey, tokenTTL))

	return r
}
