# 入れている外のスキル

外部スキルは原則 `npx skills` で導入・管理する。グローバルは `~/.agents/skills/`、プロジェクト単位では各リポジトリの `.agents/skills/` を正本とし、各ハーネスには必要に応じてリンクする。`npx skills list` と `npx skills list --global` で確認する。配布物の中身をdotfilesへコピーしない。

プロジェクトに `skills-lock.json` の記録だけでなくローカル作成スキルもある場合、導入時は `.agents/skills/` の実体・リンク先・各ハーネスの認識を合わせて確認する。

| スキル | 配布元 | メモ |
| --- | --- | --- |
| imozuru | https://github.com/MaryCache/imozuru | 調査の原文を集める |
| yomiyasu | https://github.com/nanaism/yomiyasu | 日本語の推敲 |
| stack-diagram | https://github.com/caru-ini/stack-diagram | 構成図 |
| security-audit | https://github.com/cloudflare/security-audit-skill | セキュリティの見直し |
| ax | https://github.com/yusukebe/ax | URL の取得・HTML からの抜き出し（本体の `ax` CLI は `mise/config.toml` で入れる） |
| xserver | https://developer.xserver.ne.jp/ai/skills/xserver/SKILL.md | エックスサーバーの操作（公式の Claude 向けコネクタもある：https://www.xserver.ne.jp/news_detail.php?view_id=19815） |
| orca-cli・orchestration・orca-computer-use（computer-use はその別名） | Orca（アプリが入れる） | Orca を入れると付いてくる |
| deja-history・deja-search | deja（`deja install` が入れる） | 過去の作業の検索 |
