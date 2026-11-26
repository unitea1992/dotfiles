# Source after other PATH edits in ~/.profile, or from ~/.zshenv.
# login shell だけで要る設定の置き場。

# mise の shims を PATH へ足す。login shell を通る非対話の実行（SSH のコマンド実行など）でも
# mise 管理のツール（betterleaks 等）が名前で見えるようにする。
# activate（今のディレクトリに合う版を解決する仕組み）は対話シェル側の担当（bash/common.sh）。
# systemd など login shell を通らない仕組みには効かない。
export PATH="$HOME/.local/share/mise/shims:$PATH"
