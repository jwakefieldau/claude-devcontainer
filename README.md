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
{
  "name": "bet-poc",
  "image": "mcr.microsoft.com/devcontainers/python:3.12",
  "features": {
      "ghcr.io/devcontainers/features/node:1": {},
      "ghcr.io/anthropics/devcontainer-features/claude-code:1.0": {},
      "https://github.com/jwakefieldau/claude-devcontainer/releases/download/$RELEASE_TAG/devcontainer-feature-claude-code-config.tgz": {}
  },
  "workspaceMount": "source=${localWorkspaceFolder},target=/workspaces/$FOO,type=bind,consistency=cached",
  "workspaceFolder": "/workspaces/$FOO",
  "postCreateCommand": "...",
  "remoteUser": "vscode"
}
```

# TODO
- enable CC otel, install and start an otel collection server