# Используем официальный образ Node.js
FROM node:16-alpine

# Устанавливаем директорию приложения в контейнере
WORKDIR /app

# Копируем файлы package.json и package-lock.json
COPY package*.json ./

# Устанавливаем зависимости
RUN npm ci

# Копируем все файлы проекта в контейнер
COPY . .

# Устанавливаем порт
ENV PORT=3000

EXPOSE $PORT
# Устанавливаем переменную окружения для токена телеграм-бота (может потребоваться изменение)
#ENV TELEGRAM_TOKEN=your_telegram_token

# Запускаем команду для запуска приложения
CMD ["npm", "start"]
