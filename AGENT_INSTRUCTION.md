# Agent Instructions for HypeBot Development

## Project Overview

HypeBot is a high-performance trading bot designed to interact with cryptocurrency exchanges. The project emphasizes:
- Docker-first development approach
- High-performance Rust implementation
- Clean, maintainable code structure
- Proper error handling and logging
- Health monitoring capabilities

## Technical Stack

### Core Technologies
- Rust (latest stable)
- Docker for containerization
- Axum web framework for API endpoints
- Tokio for async runtime
- Tower for middleware
- Tracing for logging

### Current Implementation
- Basic HTTP server using Axum
- Health check endpoint with JSON response
- Structured logging with tracing
- Docker multi-stage build
- Port 3000 exposed for API access

### Development Workflow

1. **Code Changes**
   - Make focused, single-purpose changes
   - Implement proper error handling
   - Include logging/tracing
   - Follow Rust best practices
   - Test changes in Docker before committing

2. **Testing Process**
   - Build the Docker image
   - Run and verify functionality
   - Test error cases
   - Only after successful testing, commit changes
   - Include both happy path and error path testing

3. **Commit Process**
   - Write clear, descriptive commit messages
   - Include the type of change (feat/fix/docs/etc.)
   - Reference any relevant issues/tickets
   - Ensure all tests pass before committing

## Implementation Order

1. **Project Setup** (Completed)
   - Initialize basic Rust project ✓
   - Set up Docker configuration ✓
   - Configure basic dependencies ✓
   - Create minimal README ✓

2. **Core Infrastructure** (In Progress)
   - Implement basic HTTP server ✓
   - Add health check endpoint ✓
   - Set up logging/tracing ✓
   - Configure proper error handling (Pending)

3. **Future Extensions** (Planned)
   - Exchange integrations
   - Trading strategies
   - Portfolio management
   - Alert system

## Code Organization

```
.
├── src/
│   ├── main.rs              # Application entry point
│   ├── routes/              # API endpoints (planned)
│   ├── services/            # Business logic (planned)
│   ├── models/              # Data structures (planned)
│   └── utils/              # Helper functions (planned)
├── Dockerfile              # Multi-stage build
├── Cargo.toml             # Dependencies
└── README.md             # Project documentation
```

## Development Guidelines

### Docker Usage
- Always develop and test within Docker
- Use multi-stage builds for minimal image size
- Expose port 3000 for API access
- Set RUST_LOG environment variable for logging
- Use debian:bookworm-slim as the runtime base

### API Design
- RESTful endpoints
- JSON responses
- Proper status codes (200 for success, 4xx/5xx for errors)
- Comprehensive error messages
- Health check endpoint at /health

### Error Handling
- Use proper Rust error handling (Result/Option)
- Provide meaningful error messages
- Include appropriate status codes
- Log errors with context
- Avoid unwrap() in production code

### Logging
- Use tracing for structured logging
- Include request/response logging via Tower middleware
- Log appropriate level (debug/info/error)
- Include relevant context in logs
- Set log level via RUST_LOG environment variable

## Interaction Guidelines

### With User
- Confirm understanding of requirements
- Build and test before committing
- Provide clear explanations of changes
- Ask for clarification when needed
- Show test results and logs

### Response Format
- Explain planned changes
- Show code modifications
- Demonstrate build/test results
- Request feedback when appropriate
- Include relevant logs or error messages

## Common Pitfalls to Avoid

1. **Development Process**
   - Don't commit before testing in Docker
   - Don't skip error handling
   - Don't ignore logging
   - Don't make multiple unrelated changes
   - Don't hardcode configuration values

2. **Technical Implementation**
   - Don't use unwrap() in production code
   - Don't ignore compiler warnings
   - Don't skip proper error types
   - Don't hardcode configuration
   - Don't ignore Docker build optimization

## Testing Instructions

1. **Build Testing**
   ```bash
   docker build -t hypebot .
   ```

2. **Run Testing**
   ```bash
   docker run -p 3000:3000 hypebot
   ```

3. **API Testing**
   ```bash
   # Health Check
   curl http://localhost:3000/health
   
   # Expected Response
   {
       "status": "healthy"
   }
   ```

4. **Log Verification**
   - Check for startup message: "listening on 0.0.0.0:3000"
   - Verify request logging from TraceLayer
   - Confirm proper log levels are used

## Success Criteria

- Docker builds successfully
- Server starts without errors
- Health endpoint returns correct response
- Proper logging is visible
- Error cases are handled gracefully
- No unwrap() calls in production code
- All compiler warnings are addressed

## Next Steps

After basic setup:
1. Add more comprehensive health checks
   - System resources
   - Database connectivity (when added)
   - External service status
2. Implement exchange integrations
   - Define exchange trait
   - Implement for specific exchanges
3. Add trading strategy framework
   - Strategy trait
   - Basic strategy implementations
4. Implement portfolio tracking
   - Position tracking
   - Balance monitoring
5. Add monitoring and alerts
   - Telegram integration
   - Discord webhooks
   - Email notifications 