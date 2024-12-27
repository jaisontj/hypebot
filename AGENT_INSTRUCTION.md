# Agent Instructions for HypeBot Development

## Project Overview
HypeBot is a Rust-based trading application designed to provide a clean interface for monitoring and executing trades across various cryptocurrency exchanges. The project follows a Docker-first approach with automated deployments to the Akash Network.

## Technical Stack
- **Language**: Rust
- **Framework**: Axum for web services
- **Container**: Docker
- **Registry**: GitHub Container Registry (ghcr.io)
- **Deployment**: Akash Network
- **CI/CD**: GitHub Actions

## Development Workflow
1. All development should be done in feature branches
2. Changes are containerized using Docker
3. Automated builds trigger on:
   - Push to main branch
   - Version tags (v*.*.*)
4. Deployments to Akash happen automatically on version tags

## Implementation Order
1. Core application structure
2. Docker containerization
3. GitHub Actions setup
4. Akash deployment configuration
5. Feature implementation

## Code Organization
```
.
├── src/              # Application source code
├── devops/           # DevOps and deployment configurations
│   └── akash/        # Akash-specific configurations
├── .github/          # GitHub Actions workflows
└── Dockerfile        # Main application Dockerfile
```

## Development Guidelines
1. Always use Docker for development and testing
2. Follow Rust best practices and idioms
3. Implement proper error handling
4. Add appropriate logging
5. Keep the codebase modular and maintainable

## Interaction Guidelines
1. Use clear commit messages following conventional commits
2. Document all major changes
3. Update README.md when adding new features
4. Tag versions appropriately for deployment

## Common Pitfalls to Avoid
1. Don't hardcode configuration values
2. Don't commit sensitive information
3. Don't bypass Docker for development
4. Don't skip error handling
5. Don't ignore failed tests

## Testing Instructions
1. Build and test locally using Docker
2. Verify health endpoint functionality
3. Check deployment configuration
4. Test Akash deployment locally before pushing

## Deployment Process
1. GitHub Actions automates the build and push to ghcr.io
2. Version tags trigger Akash deployment
3. Secrets are managed through GitHub Secrets
4. Deployment status can be monitored through GitHub Actions

## Success Criteria
1. Application builds successfully in Docker
2. All tests pass
3. GitHub Actions workflow completes
4. Akash deployment succeeds
5. Health endpoint responds correctly

## Next Steps
1. Implement exchange integrations
2. Add monitoring and alerting
3. Enhance deployment configuration
4. Implement user authentication
5. Add trading strategies 