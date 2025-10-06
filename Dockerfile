# Используем Node.js для сборки
FROM node:18-alpine AS builder

WORKDIR /app

# Копируем package.json и package-lock.json из frontend
COPY frontend/package*.json ./

# Устанавливаем зависимости
RUN npm install

# Копируем весь фронтенд-код
COPY frontend/ .

# Собираем проект
RUN npm run build

# Создаем финальный образ на базе nginx
FROM nginx:alpine

# Копируем собранные файлы из builder в nginx
COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
