FROM bitnami/golang:1.23-debian-12

RUN apt update && apt upgrade -y && apt install wget -y

RUN wget https://github.com/gohugoio/hugo/releases/download/v0.142.0/hugo_extended_0.142.0_linux-amd64.deb && \
    dpkg -i hugo_extended_0.142.0_linux-amd64.deb

COPY . /app
WORKDIR /app

EXPOSE 1313

ENTRYPOINT ["hugo"]
CMD ["server", "--baseURL", "${HUGO_BASE_URL}", "--bind", "0.0.0.0", "--port", "1313"]