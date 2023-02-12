FROM rust:1.67 as builder
WORKDIR /usr/src/myapp
COPY . .
RUN cargo install --path .

FROM debian:buster-slim
COPY --from=builder /usr/local/cargo/bin/animal_farm /usr/local/bin/animal_farm
EXPOSE 8080
CMD ["animal_farm"]
