#!/bin/sh

# If socket seems stuck use `unlink $SSH_AUTH_SOCK` to unlink it
if [ -S "$SSH_AUTH_SOCK" ]; then
	unlink "$SSH_AUTH_SOCK"
fi

# Start ssh agent
ssh-agent -a "$SSH_AUTH_SOCK" >/dev/null

# Add ssh keys to agent
ssh-add -q ~/.ssh/hetzner-server_ed25519 ~/.ssh/debian-pi_ed25519 ~/.ssh/github_ed25519 ~/.ssh/fachschaften-gitlab_ed25519 ~/.ssh/gitlab_ed25519 ~/.ssh/kde-invent_ed25519 < /dev/null

