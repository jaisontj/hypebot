# HypeBot

A high-performance cryptocurrency trading bot built with Rust, designed to interact with various exchanges through a clean and efficient API interface.

## Features

- Docker-first development and deployment
- High-performance Rust implementation
- RESTful API endpoints for interaction
- Structured logging and monitoring
- Health check system
- Multi-exchange support (planned)

## Prerequisites

- Docker Desktop
  - [Docker Desktop for Mac](https://docs.docker.com/desktop/install/mac-install/)
  - [Docker Desktop for Linux](https://docs.docker.com/desktop/install/linux-install/)

## Quick Start

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd hypebot
   ```

2. Build and run with Docker:
   ```bash
   # Build the image
   docker build -t hypebot .

   # Run the container
   docker run -p 3000:3000 hypebot
   ```

3. Test the health endpoint:
   ```bash
   curl http://localhost:3000/health
   ```

## API Endpoints

### Health Check
- **GET** `/health`
- Returns server health status
- Response format:
  ```json
  {
      "status": "healthy"
  }
  ```

## Project Structure

```
.
├── src/
│   ├── main.rs              # Application entry point
│   ├── routes/              # API endpoints (planned)
│   ├── services/            # Business logic (planned)
│   ├── models/              # Data structures (planned)
│   └── utils/              # Helper functions (planned)
├── Dockerfile              # Multi-stage build configuration
└── Cargo.toml             # Rust dependencies
```

## Development

This project uses Docker exclusively for development and deployment to ensure consistent behavior across all environments. All development and testing should be performed within the Docker container.

### Technology Stack

- **Rust**: Core programming language
- **Axum**: Web framework for API endpoints
- **Tokio**: Async runtime
- **Tower**: Middleware support
- **Tracing**: Logging and diagnostics

### Building for Development

```bash
# Build with debug symbols
docker build -t hypebot:dev .

# Run with port mapping
docker run -p 3000:3000 hypebot:dev
```

## Contributing

1. Fork the repository
2. Create your feature branch
3. Make your changes
4. Test thoroughly
5. Create a pull request

## License

MIT 