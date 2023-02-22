FROM node:18-alpine
WORKDIR /app
COPY . .
RUN npm install && cd client && npm install && npm run build
CMD ["npm", "run", "deploy"]
EXPOSE 10000