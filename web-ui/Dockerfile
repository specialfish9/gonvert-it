# Multi-stage Flutter Web with WASM support
FROM ubuntu:22.04 AS flutter-builder

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    git \
    unzip \
    xz-utils \
    zip \
    libglu1-mesa \
    wget \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Create flutter user to avoid running as root
RUN useradd -m -u 1000 flutter
USER flutter

# Install Flutter
ENV FLUTTER_HOME="/home/flutter/flutter"
ENV PATH="$FLUTTER_HOME/bin:$PATH"

RUN git clone https://github.com/flutter/flutter.git -b stable $FLUTTER_HOME

# Configure Flutter for web
RUN flutter config --enable-web
RUN flutter doctor
RUN flutter precache --web

# Set working directory
WORKDIR /home/flutter/app

# Copy dependency files for better caching
COPY --chown=flutter:flutter pubspec.yaml pubspec.lock ./

# Install dependencies
RUN flutter pub get

# Copy source code
COPY --chown=flutter:flutter lib/ lib/
COPY --chown=flutter:flutter web/ web/
COPY --chown=flutter:flutter analysis_options.yaml ./

# Build Flutter web with WASM support
RUN flutter build web \
    --release \
    --wasm

# Stage 2: Nginx server
FROM nginx:alpine

# Remove default nginx content
RUN rm -rf /usr/share/nginx/html/*

# Copy built Flutter web app
COPY --from=flutter-builder /home/flutter/app/build/web /usr/share/nginx/html

# Create nginx configuration for Flutter web with WASM support
RUN echo 'server { \
    listen 80; \
    server_name localhost; \
    root /usr/share/nginx/html; \
    index index.html; \
    \
    # Security headers required for WASM \
    add_header Cross-Origin-Embedder-Policy require-corp always; \
    add_header Cross-Origin-Opener-Policy same-origin always; \
    \
    # Handle Flutter web routing \
    location / { \
        try_files $uri $uri/ /index.html; \
    } \
    \
    # WASM files configuration \
    location ~* \.wasm$ { \
        add_header Content-Type application/wasm; \
        expires 1y; \
        add_header Cache-Control "public, immutable"; \
    } \
    \
    # Enable gzip compression \
    gzip on; \
    gzip_vary on; \
    gzip_min_length 1024; \
    gzip_types \
        text/plain \
        text/css \
        text/xml \
        text/javascript \
        application/javascript \
        application/xml+rss \
        application/json \
        application/wasm; \
    \
    # Cache static assets \
    location ~* \.(js|css|png|jpg|jpeg|gif|ico|svg|woff|woff2|ttf|eot)$ { \
        expires 1y; \
        add_header Cache-Control "public, immutable"; \
    } \
}' > /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
