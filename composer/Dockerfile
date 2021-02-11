FROM debian:bullseye-slim

LABEL maintainer="jakub@ittools.pl"

RUN apt-get update && apt-get install -y php-cli php-zip unzip wget php-xml git

RUN wget -O composer-setup.php https://getcomposer.org/installer \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer

WORKDIR /app

ENTRYPOINT ["composer"]
CMD ["-"]
