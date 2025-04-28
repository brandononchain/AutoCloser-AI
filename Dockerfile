# Base image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Install dependencies
COPY package.json turbo.json ./
RUN npm install -g turbo

# Copy apps and packages
COPY apps ./apps
COPY packages ./packages

# Install dependencies for all workspaces
RUN npm install

# Build the apps
RUN turbo run build

# Start backend server by default
CMD ["npm", "run", "start", "--workspace=apps/backend"]
