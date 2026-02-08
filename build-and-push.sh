#!/bin/bash

# Check arguments
if [ $# -lt 2 ]; then
    echo "Usage: $0 <compiler> <version> [build_latest]"
    echo "Example: $0 dmd 2.111.0 true"
    echo "Example: $0 dmd 2.111.0 false"
    echo ""
    echo "Arguments:"
    echo "  compiler     - dmd or ldc2"
    echo "  version      - version number (e.g., 2.111.0)"
    echo "  build_latest - true/false (default: true)"
    exit 1
fi

BP_DNAME=$1
BP_DVERSION=$2
BP_DLATEST=${3:-true}  # Default to true if not provided

echo "Building ${BP_DNAME} version ${BP_DVERSION}..."
echo "Build latest tag: ${BP_DLATEST}"

# Build versioned image
docker build -f Dockerfile.${BP_DNAME}.latest -t kirillsaidov/dlang:${BP_DNAME}-${BP_DVERSION} .


# Build latest image if enabled
if [ "$BP_DLATEST" = "true" ]; then
    echo "Removing old latest image (if exists)..."
    docker rmi kirillsaidov/dlang:${BP_DNAME}-latest 2>/dev/null || true
    
    echo "Building new latest image..."
    docker build -f Dockerfile.${BP_DNAME}.latest -t kirillsaidov/dlang:${BP_DNAME}-latest .
fi

# Push versioned image
docker push kirillsaidov/dlang:${BP_DNAME}-${BP_DVERSION}

# Push latest image if enabled
if [ "$BP_DLATEST" = "true" ]; then
    docker push kirillsaidov/dlang:${BP_DNAME}-latest
fi

echo "Done!"
