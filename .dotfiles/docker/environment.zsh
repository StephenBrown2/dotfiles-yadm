# Get docker build to use BuildKit
export DOCKER_BUILDKIT=1

# Get Compose to use CLI to build images (so that it uses BuildKit too)
export COMPOSE_DOCKER_CLI_BUILD=1
