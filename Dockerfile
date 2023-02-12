FROM rust:latest as builder
WORKDIR /usr/src/myapp
COPY . .
RUN cargo install --path .

FROM debian:bullseye-slim
COPY --from=builder /usr/local/cargo/bin/animal_farm /usr/local/bin/animal_farm
EXPOSE 8080
CMD ["animal_farm"]
