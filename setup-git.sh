#!/bin/bash

# Setup Git and Push to GitHub
# For luxmikant/specchain-pro

echo "🚀 Setting up Git repository..."

# Initialize git
git init

# Add all files
git add .

# Create initial commit
git commit -m "Initial commit: SpecChain Pro v0.1.0 MVP base"

# Set main branch
git branch -M main

# Add remote
git remote add origin https://github.com/luxmikant/specchain-pro.git

# Push to GitHub
echo "📤 Pushing to GitHub..."
git push -u origin main

# Create release tag
git tag -a v0.1.0 -m "Release v0.1.0: MVP Base Foundation"
git push origin v0.1.0

echo "✅ Done! Repository is now on GitHub"
echo "🔗 https://github.com/luxmikant/specchain-pro"
