FROM node:18-alpine
WORKDIR /app
RUN echo --backend deployment--
RUN npm install 
WORKDIR /app/client
RUN npm install && npm run build
WORKDIR /app
CMD ["npm", "run", "deploy"]
EXPOSE 10000