# ツールの入れ方の一覧

言語と、配布元の公式のバイナリを引けるツールは mise（`mise/config.toml`）。それ以外は、それぞれの公式の入れ方のまま、ここに一覧だけ書く。

| 入れ方 | ツール | メモ |
| --- | --- | --- |
| mise | node・python・go・pnpm、just・hyperfine・oha・onefetch・oxipng・taplo・shfmt・actionlint・topgrade | `mise install`。バージョンは `mise/config.toml` |
| rustup | Rust | mise の rust も rustup を使うので、rustup のまま |
| uv の公式の入れ方 | uv、uv で入れたツール（ruff・ty・yt-dlp・gallery-dl・git-filter-repo・rumdl・trafilatura・fonttools・androguard・websockify） | `uv tool install <名前>` |
| cargo | cargo-binstall・cargo-nextest・cargo-update・tauri-cli | mise の一覧に無い・cargo の補助 |
| go install | betterleaks（コミット前のフックが `~/go/bin/betterleaks` を使う）・gup・httpx・katana・gau・webanalyze | mise の一覧に無い・フックが場所を決め打ち |
| npm（node の全体） | DSH・dsh-TUI・clasp・Playwright の CLI・言語サーバーなど | node を mise に移す3段目で入れ直す |
| 手置き（`~/.local/bin`） | restic（バックアップが使う）・ax・deja・pi・dws・ryzenadj | 自作・専用・場所を決め打ちの物 |
| gh の拡張 | actions-lock・poi・secure・workflow-stats | `gh extension install` |
| apt | マシンごとの物（docker・tailscale・カーネルなど） | dotfiles には入れない |
