# Homebrew GAP

Homebrew tap for [GAP (Gated Agent Proxy)](https://github.com/mikekelly/gap) and [tsk](https://github.com/mikekelly/tsk).

## Installation

```bash
brew tap mikekelly/gap
```

### GAP Server

```bash
brew install gap-server
```

Start as background service:

```bash
brew services start gap-server
```

### tsk

```bash
brew install tsk
```

## Uninstall

### GAP Server

```bash
brew services stop gap-server
brew uninstall gap-server
```

### tsk

```bash
brew uninstall tsk
```

### Remove tap

```bash
brew untap mikekelly/gap
```
