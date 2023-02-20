FROM alpine:latest

WORKDIR /opt/media

RUN apk add --no-cache curl \
    && curl -s https://api.github.com/repos/langhuihui/monibuca/releases/latest | grep "browser_download_url.*linux_amd64.tar.gz" | cut -d : -f 2,3 | tr -d \" | xargs curl -L -o monibuca.tar.gz && tar -xf monibuca.tar.gz

EXPOSE 8080 1935 554 8000 8001 9000 4433

CMD ["./m7s"]