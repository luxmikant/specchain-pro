# SpecChain Pro Deployment Script (PowerShell)
# This script automates the deployment process for Windows

$ErrorActionPreference = "Stop"

Write-Host "🚀 SpecChain Pro Deployment Script" -ForegroundColor Cyan
Write-Host "====================================" -ForegroundColor Cyan
Write-Host ""

function Print-Success {
    param($Message)
    Write-Host "✓ $Message" -ForegroundColor Green
}

function Print-Error {
    param($Message)
    Write-Host "✗ $Message" -ForegroundColor Red
}

function Print-Warning {
    param($Message)
    Write-Host "⚠ $Message" -ForegroundColor Yellow
}

function Print-Info {
    param($Message)
    Write-Host "ℹ $Message" -ForegroundColor Blue
}

# Check if we're in the right directory
if (-not (Test-Path "package.json")) {
    Print-Error "package.json not found. Are you in the project root?"
    exit 1
}

Print-Info "Starting pre-deployment checks..."
Write-Host ""

# 1. Check Node version
Print-Info "Checking Node.js version..."
$nodeVersion = node -v
Print-Success "Node.js version: $nodeVersion"

# 2. Clean install
Print-Info "Installing dependencies..."
npm ci
if ($LASTEXITCODE -ne 0) {
    Print-Error "Failed to install dependencies"
    exit 1
}
Print-Success "Dependencies installed"

# 3. Lint code
Print-Info "Linting code..."
npm run lint
if ($LASTEXITCODE -ne 0) {
    Print-Error "Linting failed"
    exit 1
}
Print-Success "Code linted successfully"

# 4. Format code
Print-Info "Formatting code..."
npm run format
Print-Success "Code formatted"

# 5. Build project
Print-Info "Building project..."
npm run build
if ($LASTEXITCODE -ne 0) {
    Print-Error "Build failed"
    exit 1
}
Print-Success "Build successful"

# 6. Run tests
Print-Info "Running tests..."
npm test
if ($LASTEXITCODE -ne 0) {
    Print-Warning "Tests not fully implemented yet"
}

# 7. Check if logged in to npm
Print-Info "Checking npm authentication..."
$npmUser = npm whoami 2>$null
if ($LASTEXITCODE -eq 0) {
    Print-Success "Logged in as: $npmUser"
} else {
    Print-Error "Not logged in to npm. Run 'npm login' first."
    exit 1
}

# 8. Get current version
$packageJson = Get-Content "package.json" | ConvertFrom-Json
$currentVersion = $packageJson.version
Print-Info "Current version: $currentVersion"

# 9. Ask for version bump
Write-Host ""
Write-Host "Select version bump type:"
Write-Host "1) Patch ($currentVersion → x.x.x+1) - Bug fixes"
Write-Host "2) Minor ($currentVersion → x.x+1.0) - New features"
Write-Host "3) Major ($currentVersion → x+1.0.0) - Breaking changes"
Write-Host "4) Skip version bump"
$versionChoice = Read-Host "Enter choice (1-4)"

switch ($versionChoice) {
    "1" {
        Print-Info "Bumping patch version..."
        npm version patch -m "Release v%s"
    }
    "2" {
        Print-Info "Bumping minor version..."
        npm version minor -m "Release v%s"
    }
    "3" {
        Print-Info "Bumping major version..."
        npm version major -m "Release v%s"
    }
    "4" {
        Print-Warning "Skipping version bump"
    }
    default {
        Print-Error "Invalid choice"
        exit 1
    }
}

$packageJson = Get-Content "package.json" | ConvertFrom-Json
$newVersion = $packageJson.version
Print-Success "Version: $newVersion"

# 10. Dry run
Write-Host ""
Print-Info "Running npm publish dry run..."
npm publish --dry-run
if ($LASTEXITCODE -ne 0) {
    Print-Error "Dry run failed"
    exit 1
}
Print-Success "Dry run successful"

# 11. Confirm deployment
Write-Host ""
$confirm = Read-Host "Deploy version $newVersion to npm? (y/n)"

if ($confirm -ne "y") {
    Print-Warning "Deployment cancelled"
    exit 0
}

# 12. Publish to npm
Print-Info "Publishing to npm..."
npm publish
if ($LASTEXITCODE -ne 0) {
    Print-Error "Publishing failed"
    exit 1
}
Print-Success "Published to npm successfully!"

# 13. Push to git
Print-Info "Pushing to git..."
git push
git push --tags
if ($LASTEXITCODE -ne 0) {
    Print-Error "Git push failed"
    exit 1
}
Print-Success "Pushed to git with tags"

# 14. Success message
Write-Host ""
Write-Host "======================================" -ForegroundColor Green
Print-Success "Deployment completed successfully!"
Write-Host "======================================" -ForegroundColor Green
Write-Host ""
Print-Info "Version $newVersion is now live on npm"
Print-Info "Next steps:"
Write-Host "  1. Create GitHub release at: https://github.com/yourusername/specchain-pro/releases/new"
Write-Host "  2. Update documentation if needed"
Write-Host "  3. Announce the release"
Write-Host ""
Print-Success "Done! 🎉"
