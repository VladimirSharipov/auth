```markdown
# 🔐 Auth Service

Микросервис аутентификации на Go с JWT токенами, PostgreSQL и Docker поддержкой.

## 🚀 Возможности

- **JWT аутентификация** с Access и Refresh токенами
- **PostgreSQL** база данных с миграциями
- **Docker** контейнеризация и docker-compose
- **Graceful shutdown** и логирование
- **IP-based security** проверки
- **Полное тестовое покрытие**

## 🛠 Технологии

- **Go 1.22.2** - основной язык
- **Chi Router** - HTTP маршрутизация
- **JWT** - токены аутентификации
- **PostgreSQL** - база данных
- **Docker & Docker Compose** - контейнеризация
- **Zerolog** - структурированное логирование

## 📦 Установка

### Локальная разработка
```bash
# Клонирование репозитория
git clone https://github.com/VladimirSharipov/auth.git
cd auth

# Установка зависимостей
go mod download

# Настройка переменных окружения
cp .env.example .env
# Отредактируйте .env файл

# Запуск миграций
make mig_up

# Запуск приложения
make run
```

### Docker развертывание
```bash
# Сборка и запуск
make docker_up

# Остановка
make docker_down
```

## 🔌 API Эндпоинты

### GET /access
Получение новой пары токенов
```bash
curl "http://localhost:8080/access?guid=550e8400-e29b-41d4-a716-446655440000"
```

### POST /refresh
Обновление токенов
```bash
curl -X POST http://localhost:8080/refresh \
  -H "Content-Type: application/json" \
  -d '{"refresh_token": "base64_encoded_token"}'
```

## 🧪 Тестирование

```bash
# Локальные тесты с покрытием
make test_coverage

# Docker тесты
make docker_test
```

## 📁 Структура проекта

```
auth/
├── cmd/auth/           # Точка входа приложения
├── internal/
│   ├── handlers/       # HTTP обработчики
│   ├── database/       # Слой работы с БД
│   ├── domain/         # Бизнес-логика
│   └── models/         # Модели данных
├── migrations/         # Миграции БД
├── tests/             # Тесты
├── docker-compose.yml # Docker конфигурация
├── Dockerfile         # Docker образ
└── Makefile          # Команды сборки
```

## ⚙️ Конфигурация

Создайте `.env` файл:
```env
DB_USER=postgres
DB_PASSWORD=mypass
DB_HOST=localhost
DB_PORT=5432
DB_NAME=auth_db
OWN_KEY=your-secret-key
TOKEN_TTL=24h
```

## 🤝 Участие в разработке

1. Fork репозитория
2. Создайте feature branch
3. Внесите изменения
4. Добавьте тесты
5. Создайте Pull Request

