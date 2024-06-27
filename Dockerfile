# устанавливаем официальный образ Node.js
FROM node:20.15-alpine3.19

# указываем рабочую (корневую) директорию
WORKDIR /app

# копируем основные файлы приложения в рабочую директорию
COPY package*.json ./

# устанавливаем указанные зависимости NPM на этапе установки образа

RUN npm install express

RUN npm install -g express-generator@4

# после установки копируем все файлы проекта в корневую директорию
COPY . .
# Порт для приложения 3000
EXPOSE 3000
# запускаем основной скрипт в момент запуска контейнера
CMD express /tmp/foo && cd /tmp/foo && npm install && npm start
