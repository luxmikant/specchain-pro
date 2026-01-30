# SpecChain Pro - Deployment Guide

This guide covers deploying SpecChain Pro v0.1.0 (MVP Base) to npm and preparing for production use.

## 📋 Table of Contents

1. [Pre-Deployment Checklist](#pre-deployment-checklist)
2. [Local Testing](#local-testing)
3. [Publishing to npm](#publishing-to-npm)
4. [GitHub Repository Setup](#github-repository-setup)
5. [CI/CD Pipeline](#cicd-pipeline)
6. [Version Management](#version-management)
7. [Post-Deployment](#post-deployment)
8. [Troubleshooting](#troubleshooting)

---

## 🔍 Pre-Deployment Checklist

Before deploying, ensure everything is ready:

### 1. Code Quality
```bash
# Run linter
npm run lint

# Format code
npm run format

# Build project
npm run build

# Run tests (when available)
npm test
```

### 2. Update Package.json

Make sure these fields are correct:

```json
{
  "name": "specchain-pro",
  "version": "0.1.0",
  "description": "AI-powered specification generation with blockchain proof-of-authorship",
  "author": "Your Name <your.email@example.com>",
  "license": "MIT",
  "repository": {
    "type": "git",
    "url": "https://github.com/yourusername/specchain-pro.git"
  },
  "bugs": {
    "url": "https://github.com/yourusername/specchain-pro/issues"
  },
  "homepage": "https://github.com/yourusername/specchain-pro#readme",
  "keywords": [
    "specification",
    "blockchain",
    "ai",
    "proof-of-authorship",
    "cli",
    "ethereum",
    "layer2"
  ]
}
```

### 3. Create LICENSE File

```bash
# Create MIT License file
cat > LICENSE << 'EOF'
MIT License

Copyright (c) 2025 [Your Name]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF
```

### 4. Create .npmignore

```bash
cat > .npmignore << 'EOF'
# Source files
src/
*.ts
!*.d.ts

# Tests
**/*.test.ts
**/*.spec.ts
__tests__/
coverage/

# Development files
.kiro/
.vscode/
.idea/
*.swp
*.swo

# Documentation (keep only essential)
DEPLOYMENT_GUIDE.md
GETTING_STARTED.md

# Config files
.eslintrc.js
.prettierrc
jest.config.js
tsconfig.json

# Git
.git/
.gitignore

# Logs
*.log
npm-debug.log*

# OS
.DS_Store
Thumbs.db
EOF
```

---

## 🧪 Local Testing

### 1. Test Build Output

```bash
# Clean build
rm -rf dist
npm run build

# Check dist folder
ls -la dist/

# Verify CLI entry point exists
ls -la dist/cli/index.js
```

### 2. Test CLI Locally

```bash
# Link package locally
npm link

# Test commands
spec --help
spec --version
spec new "Test idea"
spec config show

# Unlink when done testing
npm unlink
```

### 3. Test Package Installation

```bash
# Pack the package (creates a .tgz file)
npm pack

# Install from the tarball in a test directory
mkdir ../test-install
cd ../test-install
npm install ../specchain-pro/specchain-pro-0.1.0.tgz

# Test the installed package
npx spec --help

# Clean up
cd ../specchain-pro
rm specchain-pro-0.1.0.tgz
rm -rf ../test-install
```

---

## 📦 Publishing to npm

### 1. Create npm Account

If you don't have an npm account:

```bash
# Sign up at https://www.npmjs.com/signup
# Or use CLI
npm adduser
```

### 2. Login to npm

```bash
npm login

# Verify login
npm whoami
```

### 3. Check Package Name Availability

```bash
# Check if name is available
npm search specchain-pro

# If taken, update package.json with a scoped name:
# "@yourusername/specchain-pro"
```

### 4. Publish to npm

```bash
# Dry run (see what will be published)
npm publish --dry-run

# Publish for real
npm publish

# For scoped packages (if using @username/package)
npm publish --access public
```

### 5. Verify Publication

```bash
# Check on npm
npm view specchain-pro

# Install from npm in a test directory
mkdir ../test-npm-install
cd ../test-npm-install
npm install -g specchain-pro
spec --version
spec --help

# Clean up
npm uninstall -g specchain-pro
cd ../specchain-pro
rm -rf ../test-npm-install
```

---

## 🐙 GitHub Repository Setup

### 1. Initialize Git Repository

```bash
# Initialize git (if not already done)
git init

# Add all files
git add .

# Create initial commit
git commit -m "Initial commit: SpecChain Pro v0.1.0 MVP base"
```

### 2. Create GitHub Repository

1. Go to https://github.com/new
2. Create repository named `specchain-pro`
3. Don't initialize with README (we already have one)

### 3. Push to GitHub

```bash
# Add remote
git remote add origin https://github.com/yourusername/specchain-pro.git

# Push to main branch
git branch -M main
git push -u origin main
```

### 4. Create Release

```bash
# Create a tag
git tag -a v0.1.0 -m "Release v0.1.0: MVP Base Foundation"

# Push tag
git push origin v0.1.0
```

On GitHub:
1. Go to your repository
2. Click "Releases" → "Create a new release"
3. Select tag `v0.1.0`
4. Title: "v0.1.0 - MVP Base Foundation"
5. Description:
```markdown
## 🎉 SpecChain Pro v0.1.0 - MVP Base Foundation

First release of SpecChain Pro! This is the foundational base version with project structure and core infrastructure.

### ✅ What's Included
- Complete project documentation suite
- TypeScript/Node.js infrastructure
- CLI interface skeleton with 6 commands
- Configuration management system
- Error handling and logging framework
- Type definitions for all core data structures

### 🚧 Coming Soon
- Local storage layer
- Cryptographic hashing
- Blockchain proof layer
- AI spec engine
- Export system

### 📦 Installation
```bash
npm install -g specchain-pro
spec --help
```

### 📚 Documentation
See the [README](https://github.com/yourusername/specchain-pro#readme) for full documentation.

### 🗺️ Roadmap
Check out our [18-month roadmap](.kiro/specs/specchain-pro/roadmap.md) for the full vision.
```

---

## 🔄 CI/CD Pipeline

### 1. Create GitHub Actions Workflow

```bash
mkdir -p .github/workflows
```

Create `.github/workflows/ci.yml`:

```yaml
name: CI

on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main, develop ]

jobs:
  build:
    runs-on: ubuntu-latest

    strategy:
      matrix:
        node-version: [18.x, 20.x]

    steps:
    - uses: actions/checkout@v3
    
    - name: Use Node.js ${{ matrix.node-version }}
      uses: actions/setup-node@v3
      with:
        node-version: ${{ matrix.node-version }}
        cache: 'npm'
    
    - name: Install dependencies
      run: npm ci
    
    - name: Lint
      run: npm run lint
    
    - name: Build
      run: npm run build
    
    - name: Test
      run: npm test
      continue-on-error: true  # Remove when tests are implemented

  publish:
    needs: build
    runs-on: ubuntu-latest
    if: github.event_name == 'push' && startsWith(github.ref, 'refs/tags/v')
    
    steps:
    - uses: actions/checkout@v3
    
    - name: Setup Node.js
      uses: actions/setup-node@v3
      with:
        node-version: '18.x'
        registry-url: 'https://registry.npmjs.org'
    
    - name: Install dependencies
      run: npm ci
    
    - name: Build
      run: npm run build
    
    - name: Publish to npm
      run: npm publish
      env:
        NODE_AUTH_TOKEN: ${{ secrets.NPM_TOKEN }}
```

### 2. Add npm Token to GitHub Secrets

1. Generate npm token:
   ```bash
   npm token create
   ```

2. Add to GitHub:
   - Go to repository Settings → Secrets and variables → Actions
   - Click "New repository secret"
   - Name: `NPM_TOKEN`
   - Value: Your npm token

### 3. Commit and Push Workflow

```bash
git add .github/workflows/ci.yml
git commit -m "Add CI/CD pipeline"
git push
```

---

## 📊 Version Management

### Semantic Versioning

Follow [Semantic Versioning](https://semver.org/):
- **MAJOR** (1.0.0): Breaking changes
- **MINOR** (0.1.0): New features, backward compatible
- **PATCH** (0.1.1): Bug fixes

### Version Bump Commands

```bash
# Patch version (0.1.0 → 0.1.1)
npm version patch

# Minor version (0.1.0 → 0.2.0)
npm version minor

# Major version (0.1.0 → 1.0.0)
npm version major

# This automatically:
# 1. Updates package.json
# 2. Creates a git commit
# 3. Creates a git tag
```

### Release Process

```bash
# 1. Update version
npm version minor -m "Release v%s: Add storage layer"

# 2. Push with tags
git push && git push --tags

# 3. Publish to npm
npm publish

# 4. Create GitHub release (manual or automated)
```

---

## 🚀 Post-Deployment

### 1. Update Documentation

Update README.md with installation instructions:

```markdown
## Installation

```bash
npm install -g specchain-pro
```

## Quick Start

```bash
# Check version
spec --version

# View help
spec --help

# Generate a spec
spec new "Your idea here"
```
```

### 2. Create Announcement

Share on:
- Twitter/X
- Reddit (r/programming, r/ethereum, r/node)
- Hacker News
- Dev.to
- Product Hunt (when more features are ready)

Example announcement:

```
🚀 Just launched SpecChain Pro v0.1.0!

AI-powered specification generation with blockchain proof-of-authorship.

✨ Features:
- Transform ideas into structured specs
- Blockchain-based proof of ownership
- CLI-first developer experience

📦 Install: npm install -g specchain-pro

🔗 GitHub: github.com/yourusername/specchain-pro

#opensource #blockchain #ai #developer
```

### 3. Set Up Project Website (Optional)

Use GitHub Pages for documentation:

```bash
# Create docs branch
git checkout -b gh-pages

# Copy documentation
mkdir docs
cp README.md docs/index.md
cp .kiro/specs/specchain-pro/*.md docs/

# Push to GitHub
git add docs/
git commit -m "Add documentation site"
git push origin gh-pages
```

Enable GitHub Pages:
- Repository Settings → Pages
- Source: gh-pages branch
- Folder: /docs

### 4. Monitor Package

```bash
# Check download stats
npm view specchain-pro

# Monitor issues
# Check GitHub Issues regularly

# Track npm downloads
# Use https://npm-stat.com/charts.html?package=specchain-pro
```

---

## 🐛 Troubleshooting

### Build Fails

```bash
# Clean everything
rm -rf node_modules dist package-lock.json

# Reinstall
npm install

# Rebuild
npm run build
```

### npm Publish Fails

**Error: Package name already exists**
```bash
# Use scoped package
# Update package.json: "@yourusername/specchain-pro"
npm publish --access public
```

**Error: Not logged in**
```bash
npm login
npm whoami  # Verify
```

**Error: 402 Payment Required**
```bash
# For scoped packages, use --access public
npm publish --access public
```

### CLI Not Working After Install

```bash
# Check bin field in package.json
# Should point to: "dist/cli/index.js"

# Verify file has shebang
head -n 1 dist/cli/index.js
# Should show: #!/usr/bin/env node

# Make executable
chmod +x dist/cli/index.js
```

### GitHub Actions Failing

```bash
# Check workflow file syntax
# View logs in GitHub Actions tab

# Test locally with act (GitHub Actions locally)
npm install -g act
act push
```

---

## 📈 Deployment Checklist

Use this checklist for each deployment:

### Pre-Deployment
- [ ] All tests passing
- [ ] Code linted and formatted
- [ ] Build successful
- [ ] Version bumped appropriately
- [ ] CHANGELOG.md updated
- [ ] Documentation updated

### Deployment
- [ ] npm publish successful
- [ ] GitHub release created
- [ ] Git tags pushed
- [ ] CI/CD pipeline passing

### Post-Deployment
- [ ] Package installable from npm
- [ ] CLI commands working
- [ ] Documentation site updated
- [ ] Announcement posted
- [ ] Issues/discussions monitored

---

## 🎯 Next Deployment (v0.2.0)

When you complete the next phase:

```bash
# 1. Implement features from tasks.md
# 2. Update version
npm version minor -m "Release v0.2.0: Add storage and hashing"

# 3. Update CHANGELOG.md
cat >> CHANGELOG.md << 'EOF'
## [0.2.0] - 2025-02-XX

### Added
- Local storage layer with file-based persistence
- Spec indexing system
- SHA-256 cryptographic hashing
- Spec canonicalization

### Changed
- Improved error handling
- Enhanced logging

### Fixed
- Configuration loading issues
EOF

# 4. Commit and push
git add .
git commit -m "Release v0.2.0"
git push && git push --tags

# 5. Publish
npm publish

# 6. Create GitHub release
```

---

## 📞 Support

If you encounter issues during deployment:

1. Check this guide's troubleshooting section
2. Review npm documentation: https://docs.npmjs.com/
3. Check GitHub Actions docs: https://docs.github.com/actions
4. Open an issue on GitHub

---

**Deployment Status**: Ready for v0.1.0 deployment! 🚀

**Next Steps**: Follow the steps above to publish to npm and GitHub.

Good luck with your deployment! 🎉
