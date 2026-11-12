# ツールの入れ方の一覧

言語とツールは、できるだけ mise（`mise/config.toml`）にまとめる。新しいマシンでは `mise install` の1回でそろう。それ以外は、それぞれの公式の入れ方のまま、ここに一覧だけ書く。

`topgrade` 本体はmiseの管理対象だが、更新対象の設定（`~/.config/topgrade.toml`、`~/.config/topgrade.d/`）はmiseでは配布されない。新しいマシンでは必要な更新レシピを選別し、旧機では移設済みツールの更新レシピを外す。

| 入れ方 | ツール | メモ |
| --- | --- | --- |
| mise | node・python・go・pnpm・bun・uv・Rust（stable、rust-analyzer・rust-src）、just・hyperfine・oha・onefetch・oxipng・taplo・shfmt・actionlint・topgrade・ruff・ty・yt-dlp・rumdl・restic・cargo-binstall・tauri-cli・ast-grep・gup・betterleaks | Rust は既存の rustup / Cargo home を共有し、プロジェクトの `rust-toolchain.toml` も尊重する。betterleaks は `version = "2"`・`prerelease = true` で、v2 系の最新（試験版を含む）を追う |
| mise（`pipx:`、中身は uv） | trafilatura・fonttools・androguard・websockify・gallery-dl・git-filter-repo | |
| cargo | cargo-nextest・cargo-update | mise の一覧に無い |
| go install | httpx・katana・gau・webanalyze | mise の一覧に無い。更新は gup |
| npm（node の全体） | DSH・dsh-TUI・clasp・Playwright の CLI・言語サーバーなど | node を mise に移す3段目で入れ直す |
| 手置き（`~/.local/bin`） | ax・deja・pi・dws・ryzenadj | 自作・専用の物 |
| gh の拡張 | actions-lock・poi・secure・workflow-stats | `gh extension install` |
| apt | gh、マシンごとの物（docker・tailscale・カーネルなど） | gh は apt の自動更新に任せる |

Rust のプロジェクト別バージョン指定には `rust-toolchain.toml` を使う。mise はこのファイルの `channel`・`profile`・`components`・`targets` を読み取る。Rust Analyzer を使うツールチェーンには `components = ["rust-analyzer", "rust-src"]` も指定する。プロジェクトの `mise.toml` で `idiomatic_version_file_enable_tools` を設定する場合は、グローバル設定を置き換えるため `rust` をリストに含める。rustup が読む拡張子なしの `rust-toolchain` はmiseの対象外なので、mise環境では `rust-toolchain.toml` に移行する。

`cf` と `wrangler` は全体へ入れない。リポジトリが `package.json` で版を決めているので、`~/.local/bin/cf`・`wrangler`（`bin/project-bin` へのリンク）が、今いる場所から上の `node_modules/.bin` の同じ名前を実行する。`pnpm exec` を付けたときと同じ物が動く。
