FROM node:20-alpine
WORKDIR /app
COPY package.json turbo.json ./
RUN npm install -g turbo
COPY apps ./apps
COPY packages ./packages
RUN npm install
RUN turbo run build
CMD ["npm", "run", "start", "--workspace=apps/backend"]
