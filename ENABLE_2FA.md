# Enable 2FA for npm Publishing

npm requires Two-Factor Authentication (2FA) to publish packages. Here's how to set it up:

## Option 1: Enable 2FA via Website (Recommended)

### Step 1: Login to npm
Go to: https://www.npmjs.com/login

### Step 2: Go to Account Settings
1. Click your profile picture (top right)
2. Click "Account"
3. Click "Two-Factor Authentication" in the left sidebar

### Step 3: Enable 2FA
1. Click "Enable 2FA"
2. Choose "Authorization and Publishing" (recommended)
3. Scan QR code with authenticator app:
   - Google Authenticator (iOS/Android)
   - Microsoft Authenticator (iOS/Android)
   - Authy (iOS/Android/Desktop)
4. Enter the 6-digit code from your app
5. Save your recovery codes in a safe place!

### Step 4: Publish Again
```bash
npm publish
# You'll be prompted for your 2FA code
# Enter the 6-digit code from your authenticator app
```

---

## Option 2: Enable 2FA via CLI

```bash
# Enable 2FA for authorization and publishing
npm profile enable-2fa auth-and-writes

# Follow the prompts:
# 1. Scan QR code with authenticator app
# 2. Enter 6-digit code
# 3. Save recovery codes
```

---

## Option 3: Use Access Token (Alternative)

If you don't want to use 2FA, you can create an access token:

### Step 1: Create Access Token
1. Go to: https://www.npmjs.com/settings/YOUR_USERNAME/tokens
2. Click "Generate New Token"
3. Choose "Automation" token type
4. Give it a name (e.g., "specchain-pro-publish")
5. Click "Generate Token"
6. Copy the token (you won't see it again!)

### Step 2: Configure npm to Use Token
```bash
# Set the token
npm config set //registry.npmjs.org/:_authToken YOUR_TOKEN_HERE

# Or create .npmrc file in your home directory
echo "//registry.npmjs.org/:_authToken=YOUR_TOKEN_HERE" > ~/.npmrc
```

### Step 3: Publish
```bash
npm publish
# No 2FA prompt needed!
```

---

## Recommended: Use 2FA (Option 1)

2FA is more secure and is the recommended approach.

### After Enabling 2FA

```bash
# Publish your package
npm publish

# When prompted, enter your 2FA code
# The code changes every 30 seconds in your authenticator app
```

---

## Troubleshooting

### "Invalid OTP"
- Make sure your phone's time is synced correctly
- Wait for a new code (they expire every 30 seconds)
- Try the next code if the current one doesn't work

### "Recovery codes not working"
- Contact npm support: https://www.npmjs.com/support

### "Lost authenticator app"
- Use your recovery codes
- Or contact npm support

---

## Quick Steps Summary

1. **Go to**: https://www.npmjs.com/settings/YOUR_USERNAME/account
2. **Enable 2FA**: Choose "Authorization and Publishing"
3. **Scan QR code** with authenticator app
4. **Save recovery codes**
5. **Try publishing again**: `npm publish`
6. **Enter 2FA code** when prompted

---

## After Setup

Once 2FA is enabled, every time you publish:

```bash
npm publish
# Enter one-time password: [6-digit code from app]
```

---

**Ready to enable 2FA? Go to**: https://www.npmjs.com/settings/YOUR_USERNAME/account

Then try `npm publish` again!
