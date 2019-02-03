FROM swift:4.2
ADD . /app
WORKDIR /app
EXPOSE 8080
USER root
RUN swift build -c release
CMD .build/release/AnimalFarm