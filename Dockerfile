# Используем официальный образ Node.js
FROM node:16-alpine

# Устанавливаем директорию приложения в контейнере
WORKDIR /app

# Копируем файлы package.json и package-lock.json
COPY package*.json ./

# Очищаем кеш NPM перед установкой зависимостей для избежания ошибок
RUN npm cache clean --force

# Устанавливаем зависимости
RUN npm ci --prefer-offline --no-audit

# Копируем все файлы проекта в контейнер
COPY . .

# Устанавливаем переменные окружения
ENV PORT=3000

# Открываем порт
EXPOSE $PORT

# Устанавливаем переменную окружения для токена телеграм-бота (может потребоваться изменение)
#ENV TELEGRAM_TOKEN=your_telegram_token

# Запускаем приложение
CMD ["npm", "start"]
