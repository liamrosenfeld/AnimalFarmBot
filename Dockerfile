FROM swift:5.0-xenial
ADD . /app
WORKDIR /app
EXPOSE 8080
USER root
RUN swift build -c release
CMD .build/release/AnimalFarmDiscord
