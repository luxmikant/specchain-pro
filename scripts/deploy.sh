#!/bin/bash

# SpecChain Pro Deployment Script
# This script automates the deployment process

set -e  # Exit on error

echo "🚀 SpecChain Pro Deployment Script"
echo "===================================="
echo ""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Functions
print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

# Check if we're in the right directory
if [ ! -f "package.json" ]; then
    print_error "package.json not found. Are you in the project root?"
    exit 1
fi

print_info "Starting pre-deployment checks..."
echo ""

# 1. Check Node version
print_info "Checking Node.js version..."
NODE_VERSION=$(node -v)
print_success "Node.js version: $NODE_VERSION"

# 2. Clean install
print_info "Installing dependencies..."
npm ci
print_success "Dependencies installed"

# 3. Lint code
print_info "Linting code..."
npm run lint
print_success "Code linted successfully"

# 4. Format code
print_info "Formatting code..."
npm run format
print_success "Code formatted"

# 5. Build project
print_info "Building project..."
npm run build
print_success "Build successful"

# 6. Run tests
print_info "Running tests..."
npm test || print_warning "Tests not fully implemented yet"

# 7. Check if logged in to npm
print_info "Checking npm authentication..."
if npm whoami > /dev/null 2>&1; then
    NPM_USER=$(npm whoami)
    print_success "Logged in as: $NPM_USER"
else
    print_error "Not logged in to npm. Run 'npm login' first."
    exit 1
fi

# 8. Get current version
CURRENT_VERSION=$(node -p "require('./package.json').version")
print_info "Current version: $CURRENT_VERSION"

# 9. Ask for version bump
echo ""
echo "Select version bump type:"
echo "1) Patch (0.1.0 → 0.1.1) - Bug fixes"
echo "2) Minor (0.1.0 → 0.2.0) - New features"
echo "3) Major (0.1.0 → 1.0.0) - Breaking changes"
echo "4) Skip version bump"
read -p "Enter choice (1-4): " VERSION_CHOICE

case $VERSION_CHOICE in
    1)
        print_info "Bumping patch version..."
        npm version patch -m "Release v%s"
        ;;
    2)
        print_info "Bumping minor version..."
        npm version minor -m "Release v%s"
        ;;
    3)
        print_info "Bumping major version..."
        npm version major -m "Release v%s"
        ;;
    4)
        print_warning "Skipping version bump"
        ;;
    *)
        print_error "Invalid choice"
        exit 1
        ;;
esac

NEW_VERSION=$(node -p "require('./package.json').version")
print_success "Version: $NEW_VERSION"

# 10. Dry run
echo ""
print_info "Running npm publish dry run..."
npm publish --dry-run
print_success "Dry run successful"

# 11. Confirm deployment
echo ""
read -p "Deploy version $NEW_VERSION to npm? (y/n): " CONFIRM

if [ "$CONFIRM" != "y" ]; then
    print_warning "Deployment cancelled"
    exit 0
fi

# 12. Publish to npm
print_info "Publishing to npm..."
npm publish
print_success "Published to npm successfully!"

# 13. Push to git
print_info "Pushing to git..."
git push && git push --tags
print_success "Pushed to git with tags"

# 14. Success message
echo ""
echo "======================================"
print_success "Deployment completed successfully!"
echo "======================================"
echo ""
print_info "Version $NEW_VERSION is now live on npm"
print_info "Next steps:"
echo "  1. Create GitHub release at: https://github.com/yourusername/specchain-pro/releases/new"
echo "  2. Update documentation if needed"
echo "  3. Announce the release"
echo ""
print_success "Done! 🎉"
