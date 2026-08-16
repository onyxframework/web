# ==========================================
# STAGE 1: Build the frontend application
# ==========================================
FROM node:11 AS builder

WORKDIR /app

# Copy dependency files first to leverage Docker caching layers
COPY package.json yarn.lock ./

# Install dependencies strictly matching the lockfile
RUN yarn install --frozen-lockfile

# Copy the rest of the project source code
COPY . .

# Compile and minify the static files for production
RUN yarn run build

# ==========================================
# STAGE 2: Serve the static files with Nginx
# ==========================================
FROM nginx:1.27.5-alpine-slim AS client

COPY --from=builder /app/dist /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/
