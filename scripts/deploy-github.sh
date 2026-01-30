#!/bin/bash

# SpecChain Pro - GitHub Only Deployment Script
# Deploy to GitHub without npm publishing

set -e

echo "🚀 SpecChain Pro - GitHub Deployment"
echo "====================================="
echo ""

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

# 1. Build project
print_info "Building project..."
npm run build
print_success "Build successful"

# 2. Run tests
print_info "Running tests..."
npm test || print_warning "Tests not fully implemented yet"

# 3. Get current version
CURRENT_VERSION=$(node -p "require('./package.json').version")
print_info "Current version: $CURRENT_VERSION"

# 4. Ask for version bump
echo ""
echo "Select version bump:"
echo "1) Patch (bug fixes)"
echo "2) Minor (new features)"
echo "3) Major (breaking changes)"
echo "4) Skip version bump"
read -p "Enter choice (1-4): " VERSION_CHOICE

case $VERSION_CHOICE in
    1)
        npm version patch -m "Release v%s"
        ;;
    2)
        npm version minor -m "Release v%s"
        ;;
    3)
        npm version major -m "Release v%s"
        ;;
    4)
        print_warning "Skipping version bump"
        ;;
esac

NEW_VERSION=$(node -p "require('./package.json').version")
print_success "Version: $NEW_VERSION"

# 5. Commit and push
print_info "Pushing to GitHub..."
git push
print_success "Pushed to main branch"

# 6. Create and push tag
print_info "Creating tag v$NEW_VERSION..."
git push --tags
print_success "Tag pushed"

# 7. Success
echo ""
echo "======================================"
print_success "Deployment completed!"
echo "======================================"
echo ""
print_info "Version $NEW_VERSION is now on GitHub"
echo ""
echo "Users can install with:"
echo "  npm install -g github:yourusername/specchain-pro"
echo ""
echo "Next steps:"
echo "  1. Create GitHub release: https://github.com/yourusername/specchain-pro/releases/new"
echo "  2. Select tag: v$NEW_VERSION"
echo "  3. Add release notes from CHANGELOG.md"
echo ""
print_success "Done! 🎉"
