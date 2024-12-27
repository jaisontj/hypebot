# HypeBot

A Rust-based trading application providing a clean UX to view and perform actions on various exchanges.

## Development

This project uses Docker for development and deployment. The application is deployed on the Akash Network.

### Prerequisites
- Docker
- GitHub CLI (for managing secrets and deployments)

### Development Setup
1. Clone the repository
```bash
git clone https://github.com/jaisontj/hypebot.git
cd hypebot
```

2. Build and run locally using Docker
```bash
docker build -t hypebot .
docker run -it hypebot
```

## Deployment

### GitHub Container Registry
The application is automatically built and published to GitHub Container Registry on:
- Every push to main branch
- Every tag push (v*.*.*)

### Akash Deployment
Deployments to Akash Network are automated via GitHub Actions and triggered by version tags.

1. Create a new release:
```bash
git tag -a v0.1.0 -m "Release description"
git push --tags
```

2. The GitHub Action will:
   - Build and push the Docker image
   - Deploy to Akash Network

### Project Structure
```
.
├── src/              # Application source code
├── devops/           # DevOps and deployment configurations
│   └── akash/        # Akash-specific configurations
├── .github/          # GitHub Actions workflows
└── Dockerfile        # Main application Dockerfile
```

## Contributing
1. Create a feature branch
2. Make your changes
3. Create a pull request
4. Once merged, create a version tag to trigger deployment 