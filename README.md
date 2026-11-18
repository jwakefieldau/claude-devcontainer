# About

This is a generic, reusable devcontainer for me to use Claude Code across different projects

# Install / Build

- Install https://github.com/devcontainers/cli
- `devcontainer up`
  - starts Claude
  - add `--remove-existing-container --cache-from none` to force rebuild 
- can also attach from an IDE or `devcontainer exec zsh` to pull/clone code repos first etc

# Use in projects

The `claude-code-config` feature is published as a tarball on the latest GitHub release. Reference it from another project's `devcontainer.json`:

```jsonc
"features": {
  "https://github.com/jwakefieldau/claude-devcontainer/releases/latest/download/devcontainer-feature-claude-code-config.tgz": {}
}
```

# TODO
- enable CC otel, install and start an otel collection server