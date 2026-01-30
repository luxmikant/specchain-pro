# SpecChain Pro - GitHub Only Deployment Script (PowerShell)
# Deploy to GitHub without npm publishing

$ErrorActionPreference = "Stop"

Write-Host "🚀 SpecChain Pro - GitHub Deployment" -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host ""

function Print-Success {
    param($Message)
    Write-Host "✓ $Message" -ForegroundColor Green
}

function Print-Info {
    param($Message)
    Write-Host "ℹ $Message" -ForegroundColor Blue
}

function Print-Warning {
    param($Message)
    Write-Host "⚠ $Message" -ForegroundColor Yellow
}

# 1. Build project
Print-Info "Building project..."
npm run build
if ($LASTEXITCODE -ne 0) {
    Write-Host "Build failed" -ForegroundColor Red
    exit 1
}
Print-Success "Build successful"

# 2. Run tests
Print-Info "Running tests..."
npm test
if ($LASTEXITCODE -ne 0) {
    Print-Warning "Tests not fully implemented yet"
}

# 3. Get current version
$packageJson = Get-Content "package.json" | ConvertFrom-Json
$currentVersion = $packageJson.version
Print-Info "Current version: $currentVersion"

# 4. Ask for version bump
Write-Host ""
Write-Host "Select version bump:"
Write-Host "1) Patch (bug fixes)"
Write-Host "2) Minor (new features)"
Write-Host "3) Major (breaking changes)"
Write-Host "4) Skip version bump"
$versionChoice = Read-Host "Enter choice (1-4)"

switch ($versionChoice) {
    "1" {
        npm version patch -m "Release v%s"
    }
    "2" {
        npm version minor -m "Release v%s"
    }
    "3" {
        npm version major -m "Release v%s"
    }
    "4" {
        Print-Warning "Skipping version bump"
    }
}

$packageJson = Get-Content "package.json" | ConvertFrom-Json
$newVersion = $packageJson.version
Print-Success "Version: $newVersion"

# 5. Commit and push
Print-Info "Pushing to GitHub..."
git push
if ($LASTEXITCODE -ne 0) {
    Write-Host "Git push failed" -ForegroundColor Red
    exit 1
}
Print-Success "Pushed to main branch"

# 6. Create and push tag
Print-Info "Creating tag v$newVersion..."
git push --tags
if ($LASTEXITCODE -ne 0) {
    Write-Host "Tag push failed" -ForegroundColor Red
    exit 1
}
Print-Success "Tag pushed"

# 7. Success
Write-Host ""
Write-Host "======================================" -ForegroundColor Green
Print-Success "Deployment completed!"
Write-Host "======================================" -ForegroundColor Green
Write-Host ""
Print-Info "Version $newVersion is now on GitHub"
Write-Host ""
Write-Host "Users can install with:"
Write-Host "  npm install -g github:yourusername/specchain-pro"
Write-Host ""
Write-Host "Next steps:"
Write-Host "  1. Create GitHub release: https://github.com/yourusername/specchain-pro/releases/new"
Write-Host "  2. Select tag: v$newVersion"
Write-Host "  3. Add release notes from CHANGELOG.md"
Write-Host ""
Print-Success "Done! 🎉"
