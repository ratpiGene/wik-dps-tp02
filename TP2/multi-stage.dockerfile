# docker build -t wik-dps-tp02-rust-multi -f multi-stage.dockerfile .
FROM rust:1.65 AS builder

WORKDIR /build

RUN adduser --group --no-create-home --disabled-login --system builder
RUN chown -R builder /build
USER builder

RUN cargo new --bin wik_dps_tp01
WORKDIR /build/wik_dps_tp01

COPY Cargo.* ./
ENV RUSTFLAGS='-C target-feature=+crt-static'
RUN cargo build --release
RUN rm src/*.rs
RUN rm ./target/release/deps/wik_dps_tp01*

COPY ./src ./src
RUN cargo build --release

FROM scratch
COPY --from=builder /build/wik_dps_tp01/target/release/wik_dps_tp01 /app
CMD ["/app"]