FROM ubuntu:22.04

WORKDIR /bun
RUN apt-get update
RUN apt-get install curl unzip -y
RUN curl -L -# -o bun.zip "https://github.com/Jarred-Sumner/bun/releases/download/bun-v0.1.1/bun-linux-x64.zip"
RUN unzip -q -o bun.zip
RUN mv /bun/bun-linux-x64/bun /usr/local/bin/bun

WORKDIR /app
COPY http.ts .
CMD bun run http.ts
EXPOSE 3000