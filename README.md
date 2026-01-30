# SpecChain Pro

> AI-powered specification generation with blockchain proof-of-authorship

[![Version](https://img.shields.io/badge/version-0.1.0-blue.svg)](https://github.com/yourusername/specchain-pro)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Node](https://img.shields.io/badge/node-%3E%3D18.0.0-brightgreen.svg)](https://nodejs.org)

## 🚀 Quick Start

```bash
# Install dependencies
npm install

# Build the project
npm run build

# Run in development mode
npm run dev -- new "Your idea here"

# Run tests
npm test
```

## 📋 Features

### MVP (Current Phase)
- ✅ Project structure and configuration
- 🚧 AI-powered spec generation (in progress)
- 🚧 Blockchain proof-of-authorship (in progress)
- 🚧 Cryptographic verification (in progress)
- 🚧 CLI interface (in progress)
- 🚧 Local storage (in progress)

### Coming Soon
- Remix system with attribution
- Public feed for spec discovery
- Export to multiple formats
- Local AI support for offline operation
- Web application interface

## 🛠️ Installation

### Prerequisites
- Node.js >= 18.0.0
- npm or yarn

### Option 1: Install from GitHub (Recommended)

```bash
npm install -g github:yourusername/specchain-pro
```

### Option 2: Install from Source

```bash
git clone https://github.com/yourusername/specchain-pro.git
cd specchain-pro
npm install
npm run build
npm link  # Make 'spec' command available globally
```

### Option 3: Install from npm (When Published)

```bash
npm install -g specchain-pro
```

> **Note**: npm publishing is optional. See [DEPLOY_WITHOUT_NPM.md](DEPLOY_WITHOUT_NPM.md) for alternative deployment methods.

## 📖 Usage

### Generate a new specification

```bash
spec new "Build a real-time chat application with WebRTC"
```

### Sign a specification (create blockchain proof)

```bash
spec sign spec-123
```

### Verify a specification

```bash
spec verify spec-123
```

### List all specifications

```bash
spec list
spec list --tags "web,api"
spec list --author "0xYourAddress"
```

### Export a specification

```bash
spec export spec-123 markdown
spec export spec-123 json --output ./my-spec.json
spec export spec-123 github
```

### Manage configuration

```bash
spec config show
spec config set --key ai.provider --value openai
```

## ⚙️ Configuration

Configuration is stored in `~/.specchain/config.json`. You can edit it manually or use the CLI:

```json
{
  "ai": {
    "provider": "openai",
    "model": "gpt-4",
    "temperature": 0.7,
    "maxTokens": 2000
  },
  "blockchain": {
    "network": "testnet",
    "rpcUrl": "https://sepolia.infura.io/v3/YOUR_KEY",
    "contractAddress": "0x...",
    "gasLimit": 500000
  },
  "storage": {
    "basePath": "~/.specchain",
    "maxVersionHistory": 50
  }
}
```

### Environment Variables

You can override configuration with environment variables:

```bash
export OPENAI_API_KEY="your-api-key"
export BLOCKCHAIN_RPC_URL="https://your-rpc-url"
export CONTRACT_ADDRESS="0x..."
```

## 🧪 Development

### Project Structure

```
specchain-pro/
├── src/
│   ├── cli/           # CLI interface
│   ├── core/          # Core orchestration
│   ├── ai/            # AI spec engine
│   ├── blockchain/    # Blockchain proof layer
│   ├── storage/       # Local storage
│   ├── export/        # Export system
│   ├── utils/         # Utilities
│   └── types/         # TypeScript types
├── dist/              # Compiled output
├── tests/             # Test files
└── docs/              # Documentation
```

### Running Tests

```bash
# Run all tests
npm test

# Run tests in watch mode
npm run test:watch

# Run with coverage
npm test -- --coverage
```

### Linting and Formatting

```bash
# Lint code
npm run lint

# Format code
npm run format
```

## 📚 Documentation

- [Problem Statement](.kiro/specs/specchain-pro/problem-statement.md)
- [Solution Proposal](.kiro/specs/specchain-pro/solution-proposal.md)
- [Product Roadmap](.kiro/specs/specchain-pro/roadmap.md)
- [Requirements](.kiro/specs/specchain-pro/requirements.md)
- [Design Document](.kiro/specs/specchain-pro/design.md)
- [Implementation Tasks](.kiro/specs/specchain-pro/tasks.md)

## 🗺️ Roadmap

### Phase 1: MVP (Months 1-4) - Current
- [x] Project setup and infrastructure
- [ ] Local storage layer
- [ ] Cryptographic hashing
- [ ] Blockchain proof layer
- [ ] AI spec engine
- [ ] CLI interface
- [ ] Export system

### Phase 2: Growth (Months 5-8)
- [ ] Remix and lineage system
- [ ] Public feed layer
- [ ] Local AI support
- [ ] Layer 2 optimization

### Phase 3: Web App (Months 9-12)
- [ ] React web application
- [ ] Wallet integration
- [ ] Visual spec creation
- [ ] Public feed browsing

### Phase 4: Scale (Months 13-18)
- [ ] Team collaboration
- [ ] Third-party integrations
- [ ] Enterprise features
- [ ] Community ecosystem

## 🤝 Contributing

Contributions are welcome! Please read our [Contributing Guide](CONTRIBUTING.md) for details.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- OpenAI for GPT-4 API
- Ethereum and Layer 2 communities
- All contributors and supporters

## 📞 Support

- Documentation: [docs/](docs/)
- Issues: [GitHub Issues](https://github.com/yourusername/specchain-pro/issues)
- Discussions: [GitHub Discussions](https://github.com/yourusername/specchain-pro/discussions)

---

**Status:** 🚧 MVP Development in Progress

**Version:** 0.1.0 (Alpha)

**Last Updated:** January 2025
"# specchain-pro" 
