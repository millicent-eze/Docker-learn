# 1. Base image (you choose version from Docker Hub)
FROM node:18-alpine

ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=password

# 2. Set working directory inside container
WORKDIR /node-app

# 3. Copy dependency files first (for caching)
COPY package*.json ./

# 4. Install dependencies inside container
RUN npm install

# 5. Copy the rest of the app
COPY . .

# 6. Expose the app port
EXPOSE 3000

# 7. Command to run app
CMD ["node", "app.js"]