#!/bin/sh

# populate files into appropriate destinations
#---------------------------------------------
# these files are copies created in build flow, not the originals
mv .claude.json ~vscode/
mkdir ~vscode/.claude
mv CLAUDE.md settings.json agents/ skills/ standards/ ~vscode/.claude/
chown -R 1000:1000 ~vscode/
chmod 0755 firewall-extra.sh
mv firewall-extra.sh /usr/local/bin

# init-firewall fixes
# --------------------
INIT_FIREWALL_PATH="/usr/local/bin/init-firewall.sh"

# resolve statsig.com instead of statsig.anthropic.com - it's
# fixed in their github but they haven't published a fixed image yet >:(
sed -i -e 's/statsig\.anthropic\.com/statsig\.com/g' $INIT_FIREWALL_PATH

# https://github.com/anthropics/claude-code/issues/91327
# fix is obvious but not deployed yet
sed -i -e 's/ipset add/ipset add -exist/g' $INIT_FIREWALL_PATH

# additional permitted destination IP addresses for outbound traffic
#-------------------------------------------------------------------

# TODO - add IPs to ipset named allowed-domains to permit outbound
# traffic as necessary

# this ipset is created in the claude install process:
# https://github.com/anthropics/claude-code/blob/main/.devcontainer/init-firewall.sh
