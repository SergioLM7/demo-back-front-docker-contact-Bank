## Deployment of a MERN app in Render


### In your project
 1. Folder structure

 Store your react app in a folder named client in the root of your project

 2. Install dependencies
  - `npm install concurrently nodemon`

 3. add script to backend package.json
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

### In Render

1. Go to [Render](https://render.com/)

2. Sign Up/Sign In, and go to your dashboard and click on New +

3. Select Web Service

4. On the right click beneath git on connect account and connect your git account and give appropriate permissions

5. Click on Connect to connect your repository

6. Fill out your deployment settings 

- Name: As you wish
- Region: The closest to your users
- Branch: The gitHub branch from which you'll be deploying
- Root Directory: Leave as it is
- Runtime: Node
- Build command, you must install dependencies and build your client app: `npm install && cd client && npm install && npm run build`
- Start command: `npm run production`
- Autodeploy: Yes
- Deploy hook: Leave as it is

7. Click on advanced

Add your environment variables

```
MY_MONGO_URI=*****
```

or upload your .env

8. Deploy

