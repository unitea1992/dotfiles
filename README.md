# dotfiles

開発機の設定のうち、機械にも人にも依らない物。秘密・アカウント・機械の名前は入れない。

| 場所 | 何か | 実機の場所 |
| --- | --- | --- |
| `bash/common.sh` | bash の共通の設定（プロンプト・履歴・別名・PATH） | `~/.bashrc` の最後から読む |
| `git/config` | Git の共通の設定 | `~/.gitconfig` から `[include]` で読む |
| `git/hooks/pre-commit` | 全リポジトリでコミットの前に [betterleaks](https://github.com/betterleaks/betterleaks) で秘密の混入を見る | `~/.config/git/hooks/pre-commit` |
| `starship/starship.toml` | プロンプトの見た目 | `~/.config/starship.toml` |
| `mise/config.toml` | 言語の版（node・Python・Go。Rust は rustup） | `~/.config/mise/config.toml` |
| `claude/rules/upstream-issues.md` | Claude Code に渡す決まり：外のリポジトリへの Issue・PR の出し方 | `~/.claude/rules/` に置く |
| `skills.md` | 入れている外のスキルと配布元（中身は写さない） | — |

## 入れ方

```sh
git clone https://github.com/unitea1992/dotfiles ~/projects/dotfiles
~/projects/dotfiles/install --dry-run   # するだけを表示
~/projects/dotfiles/install
```

`install` はリンクを張るだけ。前にあった物は `<名前>.before-dotfiles` に残す。`~/.bashrc` と `~/.gitconfig` は機械ごとの物なので、最後に表示される1行ずつを手で足す。

mise はリンクを張ったあと `mise install` で版を入れる。ふだん使いにするまでは `MISE_ACTIVATE=1` のときだけ効く（`bash/common.sh`）。
