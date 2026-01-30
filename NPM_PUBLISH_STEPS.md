# Publish SpecChain Pro to npm - Step by Step

The package name **"specchain-pro"** is available! ✅

Follow these exact steps to publish to npm.

---

## 📋 Prerequisites

- [ ] Node.js 18+ installed
- [ ] Project built successfully
- [ ] All tests passing (or skipped for MVP)

---

## Step 1: Create npm Account (5 minutes)

### Option A: Via Website
1. Go to https://www.npmjs.com/signup
2. Fill in:
   - Username (e.g., `yourusername`)
   - Email address
   - Password
3. Verify your email

### Option B: Via CLI
```bash
npm adduser
# Enter username, password, and email when prompted
```

---

## Step 2: Login to npm (1 minute)

```bash
# Login
npm login

# You'll be prompted for:
# - Username
# - Password
# - Email
# - One-time password (if 2FA enabled)

# Verify you're logged in
npm whoami
# Should show your username
```

---

## Step 3: Update Package Metadata (2 minutes)

Update `package.json` with your information:

```json
{
  "name": "specchain-pro",
  "version": "0.1.0",
  "description": "AI-powered specification generation with blockchain proof-of-authorship",
  "author": "Your Name <your.email@example.com>",
  "repository": {
    "type": "git",
    "url": "https://github.com/yourusername/specchain-pro.git"
  },
  "bugs": {
    "url": "https://github.com/yourusername/specchain-pro/issues"
  },
  "homepage": "https://github.com/yourusername/specchain-pro#readme"
}
```

Replace:
- `Your Name` with your actual name
- `your.email@example.com` with your email
- `yourusername` with your GitHub username

---

## Step 4: Build the Project (1 minute)

```bash
# Clean build
npm run build

# Verify dist folder exists
dir dist  # Windows
ls dist   # Linux/Mac

# Check the CLI entry point
type dist\cli\index.js  # Windows (first line should be #!/usr/bin/env node)
cat dist/cli/index.js   # Linux/Mac
```

---

## Step 5: Test Locally (2 minutes)

```bash
# Link globally
npm link

# Test commands
spec --version
spec --help
spec new "Test idea"

# Unlink
npm unlink -g specchain-pro
```

---

## Step 6: Dry Run (1 minute)

```bash
# See what will be published
npm publish --dry-run

# Review the output - should show:
# - dist/ folder
# - package.json
# - README.md
# - LICENSE
# - CHANGELOG.md
```

Expected output:
```
npm notice 📦  specchain-pro@0.1.0
npm notice === Tarball Contents ===
npm notice 1.1kB  LICENSE
npm notice 2.3kB  README.md
npm notice 1.5kB  CHANGELOG.md
npm notice 1.2kB  package.json
npm notice 15.2kB dist/...
npm notice === Tarball Details ===
npm notice name:          specchain-pro
npm notice version:       0.1.0
npm notice filename:      specchain-pro-0.1.0.tgz
npm notice package size:  XX.X kB
npm notice unpacked size: XX.X kB
npm notice total files:   XX
```

---

## Step 7: Publish to npm! (1 minute)

```bash
# Publish
npm publish

# You should see:
# + specchain-pro@0.1.0
```

If successful, you'll see:
```
npm notice
npm notice 📦  specchain-pro@0.1.0
npm notice === Tarball Details ===
npm notice name:          specchain-pro
npm notice version:       0.1.0
npm notice shasum:        [hash]
npm notice integrity:     [hash]
npm notice total files:   XX
npm notice
npm notice Publishing to https://registry.npmjs.org/
+ specchain-pro@0.1.0
```

---

## Step 8: Verify Publication (2 minutes)

```bash
# Check on npm
npm view specchain-pro

# Should show your package info
```

Visit: https://www.npmjs.com/package/specchain-pro

You should see your package page! 🎉

---

## Step 9: Test Installation (2 minutes)

```bash
# Install globally from npm
npm install -g specchain-pro

# Test it works
spec --version
spec --help

# Uninstall
npm uninstall -g specchain-pro
```

---

## Step 10: Push to GitHub (2 minutes)

```bash
# Initialize git (if not done)
git init
git add .
git commit -m "Release v0.1.0 to npm"

# Create GitHub repo, then:
git remote add origin https://github.com/yourusername/specchain-pro.git
git branch -M main
git push -u origin main

# Create release tag
git tag -a v0.1.0 -m "Release v0.1.0: Published to npm"
git push origin v0.1.0
```

---

## Step 11: Create GitHub Release (3 minutes)

1. Go to: https://github.com/yourusername/specchain-pro/releases/new
2. Click "Choose a tag" → Select `v0.1.0`
3. Release title: `v0.1.0 - MVP Base Foundation`
4. Description:

```markdown
## 🎉 SpecChain Pro v0.1.0 - MVP Base Foundation

First release of SpecChain Pro! Now available on npm.

### 📦 Installation

```bash
npm install -g specchain-pro
```

### ✅ What's Included
- Complete project infrastructure
- CLI interface with 6 commands
- Configuration management
- Error handling and logging
- Type definitions
- Comprehensive documentation

### 🚧 Coming Soon
- Local storage layer
- Blockchain proof layer
- AI spec engine
- Export system

### 📚 Documentation
- [README](https://github.com/yourusername/specchain-pro#readme)
- [Getting Started](GETTING_STARTED.md)
- [Full Roadmap](.kiro/specs/specchain-pro/roadmap.md)

### 🔗 Links
- npm: https://www.npmjs.com/package/specchain-pro
- GitHub: https://github.com/yourusername/specchain-pro
```

5. Click "Publish release"

---

## ✅ Success Checklist

- [ ] npm account created
- [ ] Logged in to npm (`npm whoami` works)
- [ ] package.json updated with your info
- [ ] Project built (`npm run build`)
- [ ] Dry run successful (`npm publish --dry-run`)
- [ ] Published to npm (`npm publish`)
- [ ] Package visible on npmjs.com
- [ ] Installation works (`npm install -g specchain-pro`)
- [ ] Pushed to GitHub
- [ ] GitHub release created

---

## 🎉 You're Live!

Your package is now published! Users can install it with:

```bash
npm install -g specchain-pro
```

---

## 📊 Monitor Your Package

### npm Stats
- Package page: https://www.npmjs.com/package/specchain-pro
- Download stats: https://npm-stat.com/charts.html?package=specchain-pro

### GitHub
- Repository: https://github.com/yourusername/specchain-pro
- Issues: https://github.com/yourusername/specchain-pro/issues
- Stars: Watch your GitHub stars grow!

---

## 🔄 Future Updates

When you add new features:

```bash
# 1. Make changes and build
npm run build

# 2. Update version
npm version patch  # 0.1.0 → 0.1.1 (bug fixes)
npm version minor  # 0.1.0 → 0.2.0 (new features)
npm version major  # 0.1.0 → 1.0.0 (breaking changes)

# 3. Publish
npm publish

# 4. Push to GitHub
git push && git push --tags

# 5. Create new GitHub release
```

Or use the automated script:

```bash
# Windows
.\scripts\deploy.ps1

# Linux/Mac
./scripts/deploy.sh
```

---

## 🐛 Troubleshooting

### Error: "You must be logged in to publish packages"
```bash
npm login
npm whoami  # Verify
```

### Error: "Package name too similar to existing package"
```bash
# Use a scoped package instead
# Update package.json: "@yourusername/specchain-pro"
npm publish --access public
```

### Error: "You do not have permission to publish"
```bash
# Make sure you're logged in as the right user
npm whoami

# If wrong user, logout and login again
npm logout
npm login
```

### Error: "402 Payment Required"
```bash
# For scoped packages, make them public
npm publish --access public
```

### Build errors
```bash
# Clean and rebuild
rmdir /s /q dist node_modules  # Windows
rm -rf dist node_modules        # Linux/Mac

npm install
npm run build
```

---

## 📢 Announce Your Package

Share on:
- **Twitter/X**: "Just published SpecChain Pro to npm! 🚀"
- **Reddit**: r/node, r/programming, r/javascript
- **Dev.to**: Write a launch post
- **Hacker News**: Show HN post
- **LinkedIn**: Professional announcement

Example tweet:
```
🚀 Just published SpecChain Pro v0.1.0 to npm!

AI-powered specification generation with blockchain proof-of-authorship.

Install: npm install -g specchain-pro

Features:
✨ Transform ideas into structured specs
🔐 Blockchain-based proof of ownership
⚡ CLI-first developer experience

#opensource #nodejs #blockchain #ai

https://www.npmjs.com/package/specchain-pro
```

---

## 🎯 Next Steps

1. ✅ Package published to npm
2. ✅ GitHub repository created
3. ✅ Release notes published
4. 📢 Announce on social media
5. 👀 Monitor downloads and issues
6. 🔨 Continue building features from tasks.md
7. 🚀 Publish updates regularly

---

**Congratulations! You're now an npm package author! 🎉**

Your package: https://www.npmjs.com/package/specchain-pro
