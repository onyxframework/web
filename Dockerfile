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

ARG VUE_APP_DOCS_URL
ARG VUE_APP_API_URL
ARG VUE_APP_BLOG_URL

RUN : "${VUE_APP_DOCS_URL:?Build argument VUE_APP_DOCS_URL is required. Pass it with --build-arg VUE_APP_DOCS_URL=value}"
RUN : "${VUE_APP_API_URL:?Build argument VUE_APP_API_URL is required. Pass it with --build-arg VUE_APP_API_URL=value}"
RUN : "${VUE_APP_BLOG_URL:?Build argument VUE_APP_BLOG_URL is required. Pass it with --build-arg VUE_APP_BLOG_URL=value}"

ENV VUE_APP_DOCS_URL=$VUE_APP_DOCS_URL
ENV VUE_APP_API_URL=$VUE_APP_API_URL
ENV VUE_APP_BLOG_URL=$VUE_APP_BLOG_URL

# Compile and minify the static files for production
RUN yarn run build

# ==========================================
# STAGE 2: Serve the static files with Nginx
# ==========================================
FROM nginx:1.27.5-alpine-slim AS client

# Install curl (for heartbeats).
RUN apk add --no-cache curl

COPY --from=builder /app/dist /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/
