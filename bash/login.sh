# Source after other PATH edits in ~/.profile, or from ~/.zshenv.
# Orca's Codex update shim must precede ~/.local/bin/codex.
if [ -x "$HOME/.local/bin/codex" ]; then
  PATH="$HOME/.local/libexec/orca-codex-update-shim:$PATH"
  export PATH
fi
