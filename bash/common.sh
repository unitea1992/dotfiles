# shellcheck shell=bash
# bash の共通の設定。~/.bashrc の最後に次の1行を足して読む（~/.bashrc 自体は機械ごとの物のまま）。
#   . ~/projects/dotfiles/bash/common.sh
# 入っていない道具の行は飛ばす。

export PATH="$HOME/.local/bin:$PATH"

# プロンプト
command -v starship >/dev/null && eval "$(starship init bash)"

# 端末の履歴
# shellcheck source=/dev/null
[ -r "$HOME/.atuin/bin/env" ] && . "$HOME/.atuin/bin/env"
command -v atuin >/dev/null && eval "$(atuin init bash)"

# 言語の版（mise）。切り替えるまでは、MISE_ACTIVATE=1 のときだけ効かせる。
if [ "${MISE_ACTIVATE:-0}" = 1 ] && command -v mise >/dev/null; then
  eval "$(mise activate bash)"
fi

# Rust（rustup）
# shellcheck source=/dev/null
[ -r "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac

# 別名
if command -v eza >/dev/null; then
  alias ls='eza --icons --group-directories-first'
  alias ll='eza -lah --icons --group-directories-first'
  alias la='eza -a --icons --group-directories-first'
  alias lt='eza --tree --level=2 --icons'
fi
command -v bat >/dev/null && alias cat='bat --paging=never'
alias grep='grep --color=auto'

# Tabby に今の場所を知らせる
__tabby_cwd_report() { printf '\033]1337;CurrentDir=%s\007' "$PWD"; }
case ";${PROMPT_COMMAND:-};" in
  *";__tabby_cwd_report;"*) ;;
  *) PROMPT_COMMAND="__tabby_cwd_report${PROMPT_COMMAND:+;$PROMPT_COMMAND}" ;;
esac
