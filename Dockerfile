FROM node:18-alpine
WORKDIR /app
COPY . .
RUN echo --backend deployment--
RUN npm install 
WORKDIR /app/client
RUN echo --frontend deployment---
RUN npm install && npm run build
WORKDIR /app
CMD ["npm", "run", "deploy"]
EXPOSE 10000