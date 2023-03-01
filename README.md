## Deployment of a MERN app in Render


### In your project
 1. Folder structure

 Store your react app in a folder named client in the root of your server project.

 2. Install dependencies
  - `npm install concurrently nodemon`

 3. Add script to server package.json

 You will want to keep scripts to run your server and your client apps separately("start", "client").

 Also you will want to keep script for development and for production ("dev", "deploy").
 

 ```
    "scripts": {
      "start": "node server.js",
      "server": "nodemon server.js",
      "client": "npm start --prefix client",
      "clientinstall": "npm install --prefix client",
      "dev": "concurrently \"npm run server\" \"npm run client\"",
      "deploy":"concurrently \"npm run server\" \"npm run client\"",
      "render-postbuild": "NPM_CONFIG_PRODUCTION=false npm install --prefix client && npm run build --prefix client"
    }

 ```
 Both apps will run in the same port, this will prevent CORS policy to apply. We will use `concurrently` to run both at the same time.  

#### To deploy with Docker 
Add a Dockerfile to your project root
```
FROM node:18-alpine
WORKDIR /app
COPY . .
RUN npm install 
WORKDIR /app/client
RUN npm install && npm run build
WORKDIR /app
CMD ["npm", "run", "deploy"]
EXPOSE 8080

```


### In Render

1. Go to [Render](https://render.com/)

2. Sign Up/Sign In, and go to your dashboard and click on New +

3. Select Web Service

4. On the right, click connect account beneath git and connect your git account and give appropriate permissions for your repository (or allow all).

5. Click on Connect to connect your repository.

6. Fill out your deployment settings. 

- Name: As you wish
- Region: Choose the closest to your users.
- Branch: The gitHub branch from which you'll be deploying
- Root Directory: Leave as it is
- Runtime: Node
- Build command, you must install dependencies and build your client app: `npm install && cd client && npm install && npm run build`
- Start command: `npm run deploy`
- Autodeploy: Yes
- Deploy hook: Leave as it is

To deploy with Docker, Render will detect automatically your Dockerfile in your root and set up the settings.

7. Click on advanced

Add your environment variables

```
MY_MONGO_URI=*****
NODE_ENV='production'
```
or upload your `.env`

8. Deploy

You can visit a deployed version of this proejct [here](https://demo-mern.onrender.com/)