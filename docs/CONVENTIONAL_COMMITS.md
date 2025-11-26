# Conventional Commits Guide

This project uses [Conventional Commits](https://www.conventionalcommits.org/) to automate versioning and changelog generation.

## Format

```
<type>(<scope>): <subject>

[optional body]

[optional footer]
```

## Commit Types

### 🚀 Release-Triggering Types

| Type | Version Impact | When to Use |
|------|----------------|-------------|
| `fix:` | **PATCH** 1.4.1 → 1.4.2 | Bug fixes, error corrections |
| `feat:` | **MINOR** 1.4.1 → 1.5.0 | New features, enhancements |
| `perf:` | **PATCH** 1.4.1 → 1.4.2 | Performance improvements |
| `BREAKING CHANGE:` | **MAJOR** 1.4.1 → 2.0.0 | Breaking API changes |

### 📝 Non-Release Types

These appear in changelogs but don't trigger new releases:

| Type | Purpose |
|------|---------|
| `chore:` | Maintenance, tooling, dependencies |
| `docs:` | Documentation only |
| `style:` | Code formatting, whitespace |
| `refactor:` | Code restructuring (no behavior change) |
| `test:` | Adding/updating tests |
| `build:` | Build system, dependencies |
| `ci:` | CI/CD configuration changes |
| `revert:` | Reverting a previous commit |

## Common Scopes

Use scopes to organize changes by component:

- `(auth)` - Authentication
- `(ui)` - User Interface  
- `(database)` - Database/Firestore
- `(api)` - API calls
- `(deps)` - Dependencies
- `(config)` - Configuration
- `(ci)` - CI/CD

## Examples

### Bug Fixes (PATCH)

```bash
git commit -m "fix(auth): resolve Firebase login timeout on slow connections"
git commit -m "fix(ui): prevent crash when loading course thumbnails"
git commit -m "fix: handle null values in user profile"
```

### New Features (MINOR)

```bash
git commit -m "feat(courses): add video playback progress tracking"
git commit -m "feat(auth): add Google sign-in support"
git commit -m "feat: implement offline mode for courses"
```

### Breaking Changes (MAJOR)

**Method 1: Using `!` after type**
```bash
git commit -m "feat(database)!: migrate to new Firestore schema"
```

**Method 2: Using `BREAKING CHANGE:` in footer**
```bash
git commit -m "feat(api): redesign authentication API

BREAKING CHANGE: Auth.login() now returns Future<User> instead of Future<bool>"
```

### Non-Release Commits

```bash
# Dependency updates
git commit -m "chore(deps): update cloud_firestore to 5.5.0"

# Documentation
git commit -m "docs: add setup instructions to README"

# CI/CD changes
git commit -m "ci: configure semantic-release for Flutter"

# Tests
git commit -m "test: add integration tests for payment flow"

# Code formatting
git commit -m "style: format code with dart format"

# Refactoring
git commit -m "refactor(auth): extract login logic to separate service"
```

### Multi-line Commits

For complex changes, add a detailed body:

```bash
git commit -m "feat(courses): add course completion certificates

- Generate PDF certificates with user name
- Store certificates in Firebase Storage  
- Add email notification when certificate is ready
- Include completion date and course details

Closes #123"
```

## Best Practices

1. ✅ **Use imperative mood**: "add" not "added", "fix" not "fixed"
2. ✅ **Be specific**: Help future you understand what changed
3. ✅ **Keep first line under 72 characters**
4. ✅ **Link issues**: Use `Closes #123` or `Fixes #456` in body
5. ✅ **Commit often**: Small, focused commits are better
6. ✅ **One logical change per commit**

## What NOT to Do

❌ Too vague:
```bash
git commit -m "fix stuff"
git commit -m "update code"
```

❌ Doesn't follow format:
```bash
git commit -m "Fixed the login bug"
git commit -m "Added dark mode feature"
```

❌ Wrong type:
```bash
git commit -m "fix: add new payment method"  # Should be "feat:"
```

❌ Missing colon:
```bash
git commit -m "feat added dark mode"  # Should have colon after feat
```

## How Semantic-Release Uses This

When you push to `main`, semantic-release automatically:

1. **Analyzes commits** since the last release
2. **Determines version bump**:
   - Contains `BREAKING CHANGE` or `!` → **MAJOR** (2.0.0)
   - Contains `feat:` → **MINOR** (1.5.0)  
   - Contains `fix:` or `perf:` → **PATCH** (1.4.2)
   - Only `chore:`, `docs:`, etc. → **NO RELEASE**
3. **Updates** `pubspec.yaml` version
4. **Generates** `CHANGELOG.md`
5. **Creates** GitHub release
6. **Deploys** to Play Store (if version bumped)

## Quick Reference

**Need a release?**
- 🐛 Bug fix → `fix:`
- ✨ New feature → `feat:`
- ⚡ Performance → `perf:`
- 💥 Breaking change → `feat!:` or `BREAKING CHANGE:`

**Don't need a release?**
- 🔧 Tooling/config → `chore:`
- 📝 Documentation → `docs:`
- 🧪 Tests → `test:`
- 🤖 CI/CD → `ci:`
- ♻️ Refactoring → `refactor:`
- 🎨 Code style → `style:`
- 🏗️ Build → `build:`

## Tools (Optional)

To enforce this format automatically:

```bash
# Install commitlint
npm install --save-dev @commitlint/{cli,config-conventional}

# Configure husky for git hooks
npm install --save-dev husky
npx husky install
npx husky add .husky/commit-msg 'npx --no -- commitlint --edit "$1"'
```

## More Information

- [Conventional Commits Specification](https://www.conventionalcommits.org/)
- [Semantic Versioning](https://semver.org/)
- [Angular Commit Guidelines](https://github.com/angular/angular/blob/master/CONTRIBUTING.md#commit)
