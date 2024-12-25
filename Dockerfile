# Build stage
FROM rust:1.74-slim as builder
WORKDIR /app
COPY . .
RUN cargo build --release

# Runtime stage
FROM debian:bookworm-slim
WORKDIR /app
RUN apt-get update && apt-get install -y ca-certificates && rm -rf /var/lib/apt/lists/*

COPY --from=builder /app/target/release/hypebot /app/hypebot

# Expose the port the app runs on
EXPOSE 3000

# Set production environment
ENV RUST_LOG=info

# Create a non-root user
RUN useradd -m -u 1000 -U -s /bin/sh -d /app appuser && \
    chown -R appuser:appuser /app

USER appuser

HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost:3000/health || exit 1

CMD ["./hypebot"] 