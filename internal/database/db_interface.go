package database

import "github.com/VladimirSharipov/auth/internal/database/models"

type DBInterface interface {
	UpdateUser(user *models.User) error
	GetUserByGUID(guid string) (*models.User, error)
	Close() error
}
