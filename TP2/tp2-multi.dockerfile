# Build : docker build -t tp2 -f tp2-multi.dockerfile .
FROM rust:latest AS builder

WORKDIR /build

RUN adduser --group --no-create-home --disabled-login --system builder
RUN chown -R builder /build
USER builder

RUN cargo new --bin tp2
WORKDIR /build/tp2

COPY Cargo.* ./
ENV RUSTFLAGS='-C target-feature=+crt-static'
RUN cargo build --release
RUN rm src/*.rs
RUN rm ./target/release/deps/tp2*

COPY ./src ./src
RUN cargo build --release

FROM scratch
COPY --from=builder /build/tp2/target/release/tp2 /app
CMD ["/app"]