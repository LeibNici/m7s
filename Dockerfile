FROM alpine:latest

WORKDIR /app

RUN apk add --no-cache curl tar && \
    latest_release=$(curl --silent "https://api.github.com/repos/langhuihui/monibuca/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")') && \
    curl -LJO "https://github.com/langhuihui/monibuca/releases/download/$latest_release/monibuca-linux-amd64.tar.gz" && \
    tar -xzvf monibuca-linux-amd64.tar.gz && \
    rm monibuca-linux-amd64.tar.gz && \
    mv monibuca*/m7s /app/m7s && \
    rm -rf monibuca*

EXPOSE 8080

CMD ["/app/m7s"]
