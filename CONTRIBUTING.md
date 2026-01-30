# Contributing to SpecChain Pro

Thank you for your interest in contributing to SpecChain Pro! This document provides guidelines and instructions for contributing.

## 🎯 How to Contribute

### 1. Find an Issue or Task

- Check [GitHub Issues](https://github.com/yourusername/specchain-pro/issues)
- Review [tasks.md](.kiro/specs/specchain-pro/tasks.md) for implementation tasks
- Look for issues labeled `good first issue` or `help wanted`

### 2. Fork and Clone

```bash
# Fork the repository on GitHub
# Then clone your fork
git clone https://github.com/YOUR_USERNAME/specchain-pro.git
cd specchain-pro

# Add upstream remote
git remote add upstream https://github.com/yourusername/specchain-pro.git
```

### 3. Create a Branch

```bash
# Create a feature branch
git checkout -b feature/your-feature-name

# Or for bug fixes
git checkout -b fix/bug-description
```

### 4. Make Changes

```bash
# Install dependencies
npm install

# Make your changes
# ...

# Test your changes
npm run build
npm test
npm run lint
```

### 5. Commit Changes

Follow [Conventional Commits](https://www.conventionalcommits.org/):

```bash
# Format: <type>(<scope>): <description>

git commit -m "feat(storage): implement file-based storage layer"
git commit -m "fix(cli): resolve config loading issue"
git commit -m "docs(readme): update installation instructions"
```

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, etc.)
- `refactor`: Code refactoring
- `test`: Adding or updating tests
- `chore`: Maintenance tasks

### 6. Push and Create Pull Request

```bash
# Push to your fork
git push origin feature/your-feature-name

# Create Pull Request on GitHub
# Fill out the PR template
```

## 📋 Development Guidelines

### Code Style

- Follow TypeScript best practices
- Use ESLint and Prettier (configured in project)
- Write clear, self-documenting code
- Add comments for complex logic

```bash
# Format code
npm run format

# Lint code
npm run lint
```

### Testing

- Write unit tests for new features
- Ensure all tests pass before submitting PR
- Aim for 80%+ code coverage

```bash
# Run tests
npm test

# Run tests with coverage
npm test -- --coverage
```

### Documentation

- Update README.md if adding user-facing features
- Update relevant documentation in `.kiro/specs/`
- Add JSDoc comments for public APIs
- Update CHANGELOG.md

### Commit Messages

Good commit messages:
```
feat(ai): add OpenAI GPT-4 integration
fix(blockchain): resolve transaction retry logic
docs(api): document storage layer interface
test(hash): add property tests for canonicalization
```

Bad commit messages:
```
update code
fix bug
changes
wip
```

## 🏗️ Project Structure

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
├── tests/             # Test files
└── .kiro/specs/       # Documentation
```

## 🎨 Coding Standards

### TypeScript

```typescript
// Use explicit types
function generateSpec(idea: string): SpecDocument {
  // ...
}

// Use interfaces for objects
interface SpecMetadata {
  id: string;
  author: string;
  createdAt: Date;
}

// Use enums for constants
enum ErrorCode {
  AI_GENERATION_FAILED = 'AI_001',
  BLOCKCHAIN_NETWORK_ERROR = 'BC_001',
}

// Handle errors properly
try {
  await someOperation();
} catch (error) {
  log.error('Operation failed', { error });
  throw new SpecChainError(
    ErrorCode.OPERATION_FAILED,
    'Descriptive message',
    error,
    true,
    'Suggested action'
  );
}
```

### Async/Await

```typescript
// Prefer async/await over promises
async function loadConfig(): Promise<AppConfig> {
  const data = await fs.readFile(CONFIG_FILE, 'utf-8');
  return JSON.parse(data);
}

// Handle errors
async function safeOperation() {
  try {
    return await riskyOperation();
  } catch (error) {
    log.error('Operation failed', { error });
    throw error;
  }
}
```

## 🧪 Testing Guidelines

### Unit Tests

```typescript
describe('ConfigManager', () => {
  it('should load default configuration', async () => {
    const config = await configManager.load();
    expect(config.ai.provider).toBe('openai');
  });

  it('should validate configuration', () => {
    const invalidConfig = { ai: { provider: 'invalid' } };
    expect(() => configManager.validate(invalidConfig)).toThrow();
  });
});
```

### Property-Based Tests

```typescript
import fc from 'fast-check';

describe('Hash Consistency', () => {
  it('should produce same hash for identical content', async () => {
    await fc.assert(
      fc.asyncProperty(fc.string(), async (content) => {
        const hash1 = await computeHash(content);
        const hash2 = await computeHash(content);
        expect(hash1).toBe(hash2);
      }),
      { numRuns: 100 }
    );
  });
});
```

## 📝 Pull Request Process

### Before Submitting

- [ ] Code builds successfully (`npm run build`)
- [ ] All tests pass (`npm test`)
- [ ] Code is linted (`npm run lint`)
- [ ] Code is formatted (`npm run format`)
- [ ] Documentation is updated
- [ ] CHANGELOG.md is updated
- [ ] Commit messages follow conventions

### PR Template

When creating a PR, include:

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update

## Related Issue
Closes #123

## Testing
Describe testing performed

## Checklist
- [ ] Tests pass
- [ ] Code is linted
- [ ] Documentation updated
- [ ] CHANGELOG updated
```

### Review Process

1. Automated checks run (CI/CD)
2. Code review by maintainers
3. Address feedback
4. Approval and merge

## 🐛 Reporting Bugs

### Before Reporting

- Check existing issues
- Verify it's reproducible
- Gather relevant information

### Bug Report Template

```markdown
**Describe the bug**
Clear description of the bug

**To Reproduce**
Steps to reproduce:
1. Run command '...'
2. See error

**Expected behavior**
What should happen

**Actual behavior**
What actually happens

**Environment**
- OS: [e.g., Windows 11]
- Node version: [e.g., 18.0.0]
- Package version: [e.g., 0.1.0]

**Additional context**
Any other relevant information
```

## 💡 Feature Requests

### Before Requesting

- Check if feature already exists
- Review roadmap in `.kiro/specs/specchain-pro/roadmap.md`
- Check if similar request exists

### Feature Request Template

```markdown
**Is your feature request related to a problem?**
Description of the problem

**Describe the solution you'd like**
Clear description of desired feature

**Describe alternatives you've considered**
Alternative solutions or features

**Additional context**
Any other relevant information
```

## 📚 Resources

- [Project Documentation](.kiro/specs/specchain-pro/)
- [Design Document](.kiro/specs/specchain-pro/design.md)
- [Requirements](.kiro/specs/specchain-pro/requirements.md)
- [Tasks](.kiro/specs/specchain-pro/tasks.md)
- [Roadmap](.kiro/specs/specchain-pro/roadmap.md)

## 🤝 Code of Conduct

### Our Pledge

We pledge to make participation in our project a harassment-free experience for everyone.

### Our Standards

**Positive behavior:**
- Using welcoming and inclusive language
- Being respectful of differing viewpoints
- Gracefully accepting constructive criticism
- Focusing on what is best for the community

**Unacceptable behavior:**
- Trolling, insulting/derogatory comments
- Public or private harassment
- Publishing others' private information
- Other conduct which could reasonably be considered inappropriate

### Enforcement

Instances of abusive behavior may be reported to project maintainers. All complaints will be reviewed and investigated.

## 📞 Questions?

- Open a [GitHub Discussion](https://github.com/yourusername/specchain-pro/discussions)
- Check [Getting Started Guide](GETTING_STARTED.md)
- Review [Documentation](.kiro/specs/specchain-pro/)

## 🎉 Thank You!

Your contributions make SpecChain Pro better for everyone. We appreciate your time and effort!

---

**Happy Contributing! 🚀**
