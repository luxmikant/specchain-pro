# Setup Git and Push to GitHub (PowerShell)
# For luxmikant/specchain-pro

Write-Host "🚀 Setting up Git repository..." -ForegroundColor Cyan

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
Write-Host "📤 Pushing to GitHub..." -ForegroundColor Cyan
git push -u origin main

# Create release tag
git tag -a v0.1.0 -m "Release v0.1.0: MVP Base Foundation"
git push origin v0.1.0

Write-Host "✅ Done! Repository is now on GitHub" -ForegroundColor Green
Write-Host "🔗 https://github.com/luxmikant/specchain-pro" -ForegroundColor Blue
