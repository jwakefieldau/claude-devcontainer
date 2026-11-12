#!/bin/sh

# these files are copies created in build flow, not the originals
mv .claude.json ~vscode/
mkdir ~vscode/.claude
mv CLAUDE.md settings.json agents/ ~vscode/.claude/
chown -R 1000:1000 ~vscode/

# fix the firewall script to resolve statsig.com instead of
# statsig.anthropic.com - it's fixed in their github but they haven't
# published a fixed image yet >:(

#TODO

# TODO - add IPs to ipset named allowed-domains to permit outbound
# traffic as necessary

# this ipset is created in the claude install process:
# https://github.com/anthropics/claude-code/blob/main/.devcontainer/init-firewall.sh

chmod 0755 firewall-extra.sh
cp -a firewall-extra.sh /usr/local/bin
