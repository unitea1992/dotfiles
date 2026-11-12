# shellcheck shell=bash
# bash の共通の設定。~/.bashrc の最後に次の1行を足して読む（~/.bashrc 自体はマシンごとのファイルのまま）。
#   . ~/projects/dotfiles/bash/common.sh
# 入っていないツールの行は飛ばす。

export PATH="$HOME/.local/bin:$PATH"

# 言語のバージョン（mise）。手で開くシェルでは既定で効かせる。止めるときは MISE_ACTIVATE=0。
# 常駐の仕組み（systemd）はシェルを通らないので、ここでは変わらない。
if [ "${MISE_ACTIVATE:-1}" = 1 ] && command -v mise >/dev/null; then
  eval "$(mise activate bash)"
fi

# プロンプト。starship は mise で入れるので、mise を有効にした後に読む。
command -v starship >/dev/null && eval "$(starship init bash)"

# 端末の履歴。atuin も mise で入れるので、mise を有効にした後に読む（公式の入れ方の ~/.atuin/bin があればそれも通す）。
# shellcheck source=/dev/null
[ -r "$HOME/.atuin/bin/env" ] && . "$HOME/.atuin/bin/env"
command -v atuin >/dev/null && eval "$(atuin init bash)"

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

# Tabby に今の場所を通知する
__tabby_cwd_report() { printf '\033]1337;CurrentDir=%s\007' "$PWD"; }
case ";${PROMPT_COMMAND:-};" in
  *";__tabby_cwd_report;"*) ;;
  *) PROMPT_COMMAND="__tabby_cwd_report${PROMPT_COMMAND:+;$PROMPT_COMMAND}" ;;
esac
