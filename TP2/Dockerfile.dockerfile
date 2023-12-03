# docker build -t tp2 -f Dockerfile.dockerfile .
FROM rust:1.65
WORKDIR /app

RUN adduser --no-create-home --disabled-login --group --system www
RUN chown www -R /app
USER www

RUN cargo new --bin wik_dps_tp01
WORKDIR /app/wik_dps_tp01

COPY Cargo.* ./
RUN cargo build --release
RUN rm src/*.rs
RUN rm -rf .git/ .gitignore

COPY ./src ./src
# RUN rm ./target/release/deps/wik_dps_tp01*
RUN cargo build --release

CMD ./target/release/wik_dps_tp01