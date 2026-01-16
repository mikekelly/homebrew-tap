# Homebrew GAP

Homebrew tap for [GAP (Gated Agent Proxy)](https://github.com/mikekelly/gap) and [tsk](https://github.com/mikekelly/tsk).

## Installation

```bash
brew tap mikekelly/tap
```

### GAP Server

```bash
brew install gap
```

Start as background service:

```bash
brew services start gap
```

### tsk

```bash
brew install tsk
```

## Uninstall

### GAP Server

```bash
brew services stop gap
brew uninstall gap
```

### tsk

```bash
brew uninstall tsk
```

### Remove tap

```bash
brew untap mikekelly/tap
```
