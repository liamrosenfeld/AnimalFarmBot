FROM swift:xenial as builder
WORKDIR /root
COPY . .
RUN apt-get update && apt-get install -y zlib1g-dev libssl-dev
RUN swift build -c release

FROM swift:xenial-slim
WORKDIR /root
COPY --from=builder /root .
EXPOSE 8080
CMD .build/release/AnimalFarmDiscord
