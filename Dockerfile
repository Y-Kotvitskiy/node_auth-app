# Етап 1: Встановлення залежностей та збірка
FROM node:24-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
# Якщо використовуєте TypeScript або esbuild:
RUN npm run build || true 

COPY package*.json ./
# Встановлюємо лише продакшен-залежності
RUN npm ci --omit=dev

# Копіюємо зібраний JS-код з першого етапу (або весь проект, якщо це чистий JS)
COPY --from=builder /app ./

EXPOSE 3000
CMD ["node", "src/index.js"] 