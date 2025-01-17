# Builder stage
FROM golang:1.23.3-alpine AS builder

WORKDIR /usr/local/src

# Копируем go.mod и go.sum для управления зависимостями
COPY ["go.mod", "go.sum", "./"]

# Загружаем зависимости
RUN go mod download

# Копируем весь исходный код
COPY . ./

# Сборка Go-приложения
RUN go build -o ./bin/app cmd/auth/main.go

# Runner stage (с Go для тестов)
FROM golang:1.22.3-alpine AS runner

# Копируем скомпилированное приложение из builder stage
COPY --from=builder /usr/local/src/bin/app /

# Копируем весь исходный код для запуска тестов и работы приложения
COPY . /usr/local/src/


WORKDIR /usr/local/src/

# Открываем порт для приложения
EXPOSE 8080

# Стартовое командное приложение
CMD ["/app"]
