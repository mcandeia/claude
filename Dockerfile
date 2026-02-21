FROM node:20-slim

# System dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    openssh-client \
    curl \
    jq \
    bc \
    ca-certificates \
    gpg \
    && rm -rf /var/lib/apt/lists/*

# Install GitHub CLI
RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg \
    | gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
    | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && apt-get update && apt-get install -y gh \
    && rm -rf /var/lib/apt/lists/*

# Install ttyd for WebSocket PTY server
RUN curl -fsSL -o /usr/local/bin/ttyd \
    https://github.com/tsl0922/ttyd/releases/download/1.7.7/ttyd.$(dpkg --print-architecture) \
    && chmod +x /usr/local/bin/ttyd

# Install Claude Code CLI
RUN npm install -g @anthropic-ai/claude-code

# Setup non-root user (Claude Code won't run as root)
RUN mkdir -p /home/node/.claude /home/node/.ssh /home/node/workspace \
    && chown -R node:node /home/node

USER node
WORKDIR /home/node/workspace

ENV HOME=/home/node \
    CLAUDE_PTY_PORT=7681

# Copy configuration
COPY --chown=node:node CLAUDE.md /home/node/.claude/CLAUDE.md
COPY --chown=node:node settings.json /home/node/.claude/settings.json
COPY --chown=node:node skills/ /home/node/.claude/skills/
COPY --chown=node:node entrypoint.sh /usr/local/bin/entrypoint

EXPOSE 7681

ENTRYPOINT ["/usr/local/bin/entrypoint"]
