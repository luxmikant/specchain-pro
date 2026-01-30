# Quick Deployment Guide

## 🚀 Deploy in 5 Minutes

### Prerequisites
- Node.js 18+ installed
- npm account created
- Git repository initialized

### Step 1: Prepare Package (1 min)

```bash
# Update package.json with your details
# - name: "specchain-pro" or "@yourusername/specchain-pro"
# - author: "Your Name <email@example.com>"
# - repository: Your GitHub URL

# Build the project
npm run build
```

### Step 2: Test Locally (1 min)

```bash
# Test the CLI
npm link
spec --help
spec --version
npm unlink
```

### Step 3: Login to npm (30 sec)

```bash
npm login
# Enter username, password, email
npm whoami  # Verify login
```

### Step 4: Publish to npm (1 min)

```bash
# Dry run first
npm publish --dry-run

# Publish for real
npm publish

# For scoped packages (@username/package)
npm publish --access public
```

### Step 5: Push to GitHub (1 min)

```bash
# Initialize git (if not done)
git init
git add .
git commit -m "Initial release v0.1.0"

# Create GitHub repo, then:
git remote add origin https://github.com/yourusername/specchain-pro.git
git branch -M main
git push -u origin main

# Create tag
git tag -a v0.1.0 -m "Release v0.1.0"
git push origin v0.1.0
```

### Step 6: Verify (30 sec)

```bash
# Check on npm
npm view specchain-pro

# Install globally and test
npm install -g specchain-pro
spec --version
```

## ✅ Done!

Your package is now live on npm! 🎉

### Next Steps

1. **Create GitHub Release**
   - Go to: https://github.com/yourusername/specchain-pro/releases/new
   - Select tag: v0.1.0
   - Add release notes from CHANGELOG.md

2. **Share Your Project**
   - Twitter/X
   - Reddit (r/node, r/programming)
   - Dev.to
   - Hacker News

3. **Monitor**
   - npm downloads: https://npm-stat.com/charts.html?package=specchain-pro
   - GitHub stars and issues

---

## 🔧 Automated Deployment (Recommended)

### Using Deployment Script

**Linux/Mac:**
```bash
chmod +x scripts/deploy.sh
./scripts/deploy.sh
```

**Windows:**
```powershell
.\scripts\deploy.ps1
```

The script will:
- ✓ Run all checks
- ✓ Build the project
- ✓ Bump version
- ✓ Publish to npm
- ✓ Push to git with tags

---

## 🐛 Common Issues

### "Package name already taken"
```bash
# Use scoped package
# Update package.json: "@yourusername/specchain-pro"
npm publish --access public
```

### "Not logged in"
```bash
npm login
npm whoami
```

### "Build fails"
```bash
rm -rf node_modules dist
npm install
npm run build
```

### "CLI not working"
```bash
# Check dist/cli/index.js has shebang
head -n 1 dist/cli/index.js
# Should show: #!/usr/bin/env node

# Make executable (Linux/Mac)
chmod +x dist/cli/index.js
```

---

## 📊 Deployment Checklist

- [ ] package.json updated with your details
- [ ] Build successful (`npm run build`)
- [ ] Tests passing (`npm test`)
- [ ] Logged in to npm (`npm whoami`)
- [ ] Published to npm (`npm publish`)
- [ ] Pushed to GitHub with tags
- [ ] GitHub release created
- [ ] Package installable (`npm install -g specchain-pro`)
- [ ] CLI working (`spec --help`)

---

## 🎯 Version Updates

For future releases:

```bash
# Bug fix (0.1.0 → 0.1.1)
npm version patch
npm publish
git push && git push --tags

# New feature (0.1.0 → 0.2.0)
npm version minor
npm publish
git push && git push --tags

# Breaking change (0.1.0 → 1.0.0)
npm version major
npm publish
git push && git push --tags
```

---

## 📚 Full Documentation

For detailed deployment instructions, see [DEPLOYMENT_GUIDE.md](DEPLOYMENT_GUIDE.md)

---

**Ready to deploy? Let's go! 🚀**
