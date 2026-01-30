# Getting Started with SpecChain Pro

Welcome to SpecChain Pro! This guide will help you get started with the MVP base version.

## 🎯 What's Implemented (v0.1.0 - MVP Base)

### ✅ Completed
- Project structure and build system
- TypeScript configuration with strict mode
- Configuration management system
- Error handling framework with logging
- CLI interface skeleton with 6 commands
- Type definitions for all core data structures

### 🚧 In Progress (Next Steps)
- Local storage layer
- Cryptographic hashing
- Blockchain proof layer
- AI spec engine
- Export system

## 📦 Installation

### Prerequisites
- Node.js >= 18.0.0
- npm or yarn

### Install Dependencies

```bash
npm install
```

### Build the Project

```bash
npm run build
```

### Test the CLI

```bash
# Run in development mode
npm run dev -- --help

# Or after building, link globally
npm link
spec --help
```

## 🎮 Available Commands

Currently, all commands are implemented as skeletons and will show "not yet implemented" messages:

```bash
# Generate a new specification
spec new "Your idea here"

# Create blockchain proof
spec sign <spec-id>

# Verify a specification
spec verify <spec-id>

# List all specifications
spec list

# Export a specification
spec export <spec-id> <format>

# Manage configuration
spec config show
```

## 🗂️ Project Structure

```
specchain-pro/
├── src/
│   ├── cli/
│   │   └── index.ts          # CLI entry point with Commander.js
│   ├── core/
│   │   └── config.ts          # Configuration management
│   ├── utils/
│   │   └── logger.ts          # Logging with sensitive data redaction
│   └── types/
│       └── index.ts           # TypeScript type definitions
├── dist/                      # Compiled JavaScript output
├── .kiro/specs/specchain-pro/ # Complete project documentation
│   ├── problem-statement.md
│   ├── solution-proposal.md
│   ├── roadmap.md
│   ├── requirements.md
│   ├── design.md
│   └── tasks.md
├── package.json
├── tsconfig.json
├── jest.config.js
└── README.md
```

## ⚙️ Configuration

The configuration file is created automatically at `~/.specchain/config.json` on first run.

### Default Configuration

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
    "rpcUrl": "https://sepolia.infura.io/v3/YOUR_INFURA_KEY",
    "contractAddress": "0x0000000000000000000000000000000000000000",
    "gasLimit": 500000
  },
  "storage": {
    "basePath": "~/.specchain",
    "maxVersionHistory": 50
  },
  "user": {
    "name": "",
    "email": "",
    "defaultTags": []
  }
}
```

### Environment Variables

Override configuration with environment variables:

```bash
export OPENAI_API_KEY="your-api-key"
export BLOCKCHAIN_RPC_URL="https://your-rpc-url"
export CONTRACT_ADDRESS="0x..."
```

## 🧪 Development

### Run Tests

```bash
npm test
```

### Lint Code

```bash
npm run lint
```

### Format Code

```bash
npm run format
```

### Development Mode

```bash
# Run CLI in development mode with verbose logging
npm run dev -- --verbose new "Test idea"
```

## 📋 Next Implementation Steps

Based on the roadmap, here's what's coming next:

### Week 1-2: Storage & Cryptography
1. Implement file-based storage system
2. Create spec indexing
3. Add SHA-256 hashing with canonicalization

### Week 3-4: Blockchain Integration
1. Set up ethers.js and blockchain providers
2. Implement secure key management
3. Deploy smart contract to testnet
4. Create proof creation and verification

### Week 5-6: AI Integration
1. Integrate OpenAI GPT-4 API
2. Design prompt templates
3. Implement spec generation
4. Add input validation

### Week 7-8: Complete CLI & Export
1. Wire up all CLI commands
2. Implement export system
3. Add comprehensive testing
4. Write documentation

## 🚀 Deployment Roadmap

### Phase 1: MVP (Current - Month 4)
- Complete core CLI functionality
- Deploy to npm registry
- Launch documentation website

### Phase 2: Growth (Months 5-8)
- Add remix and lineage system
- Implement public feed
- Add local AI support

### Phase 3: Web App (Months 9-12)
- Build React web application
- Add wallet integration
- Launch public web interface

### Phase 4: Scale (Months 13-18)
- Enterprise features
- Team collaboration
- Market leadership

## 📚 Documentation

- [Problem Statement](.kiro/specs/specchain-pro/problem-statement.md) - Why we're building this
- [Solution Proposal](.kiro/specs/specchain-pro/solution-proposal.md) - How it works
- [Product Roadmap](.kiro/specs/specchain-pro/roadmap.md) - Timeline and milestones
- [Requirements](.kiro/specs/specchain-pro/requirements.md) - What we're building
- [Design Document](.kiro/specs/specchain-pro/design.md) - Architecture details
- [Implementation Tasks](.kiro/specs/specchain-pro/tasks.md) - Task breakdown

## 🤝 Contributing

We welcome contributions! Here's how to get started:

1. Read the documentation in `.kiro/specs/specchain-pro/`
2. Check the tasks.md file for available tasks
3. Pick a task from Phase 1 (MVP)
4. Create a feature branch
5. Implement with tests
6. Submit a pull request

## 💡 Tips

### For Developers
- Start with the design document to understand the architecture
- Follow the task list in order for best results
- Write tests as you implement features
- Use verbose mode (`--verbose`) for debugging

### For Contributors
- Focus on Phase 1 tasks first
- Each task has clear acceptance criteria in requirements.md
- Property-based tests (marked with *) are optional for MVP
- Ask questions in GitHub Discussions

## 🐛 Troubleshooting

### Build Errors
```bash
# Clean and rebuild
rm -rf dist node_modules
npm install
npm run build
```

### Configuration Issues
```bash
# Reset configuration to defaults
rm ~/.specchain/config.json
spec config show  # This will recreate defaults
```

### CLI Not Found
```bash
# Relink the CLI
npm unlink
npm link
```

## 📞 Support

- **Documentation**: See `.kiro/specs/specchain-pro/` folder
- **Issues**: Create a GitHub issue
- **Discussions**: Use GitHub Discussions for questions

## 🎉 What's Next?

1. **Review the documentation** in `.kiro/specs/specchain-pro/`
2. **Check the roadmap** to see the full vision
3. **Start implementing** the next task from tasks.md
4. **Join the community** and contribute!

---

**Current Version**: 0.1.0 (MVP Base - Foundation Complete)

**Status**: ✅ Project structure ready, 🚧 Core features in development

**Next Milestone**: Complete storage layer and cryptographic hashing (Week 1-2)

Happy coding! 🚀
