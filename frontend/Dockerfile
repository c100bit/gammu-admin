FROM dart:stable AS build

WORKDIR /app

ARG backend

# download Flutter SDK from Flutter Github repo
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter

# Set flutter environment path
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

RUN flutter channel stable && flutter config --enable-web

# Copy app source code and AOT compile it.
COPY . .

# Generate a production build.
RUN flutter clean && flutter build web --dart-define=backend=${backend}

FROM nginx:1.21.1-alpine

RUN apk add --no-cache tzdata
ENV TZ=Europe/Moscow

COPY --from=build /app/build/web /usr/share/nginx/html
