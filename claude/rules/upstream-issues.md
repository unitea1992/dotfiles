# 外のリポジトリへの Issue・PR の出し方

Orca・DSH・Vite など、他人のリポジトリへ不具合や要望を出すときの手順。どのプロジェクトで作業していても当てる。

1. **探す**：同じ要望の Issue・PR がもう無いかを、相手のリポジトリで `gh search issues` と `gh search prs` を使い、何語かで探す。あれば新しく出さず、その Issue に足す情報があるかをオーナーに相談する。
2. **相手の決まりを読む**：`.github/ISSUE_TEMPLATE/`（用紙と `config.yml`）・`CONTRIBUTING.md`・`SECURITY.md` を読み、題名の付け方、項目、言語、ラベルに合わせる。用紙しか受け付けないリポジトリでは、用紙の項目の見出しをそのまま本文に並べる。シークレットに関わる不具合は公開の Issue にせず、`SECURITY.md` の道を使う。
3. **書く**：相手の言語で書く。再現の手順と、こちらで確かめた数字を入れる。個人の情報（マシン名、内部のアドレス、キー、事業の値）は入れない。
4. **見せる**：下書きと日本語の要約を、オーナーに見せて了承を得る（`github-accounts.md` のとおり）。
5. **出す**：オーナーのアカウントで出す（`GH_TOKEN=$(gh auth token -u unitea1992) gh issue create --repo <相手> ...`）。
6. **記録する**：出した URL を、関係する Issue（alinavigator なら該当の Issue）に1行で残す。回り道を入れたなら、直ったら消す旨も書く。

出した Issue のその後の動きは、毎朝 8:00 の Orca の自動化が拾って、返事の下書きを Orca のチャットに残す。自動化は名前ではなく ID `eff1e214-b002-449a-add2-d8dec9df78b7` で指す（名前はオーナーが変えることがある。`orca automations list --json` で引く）。確認と指示は home-lab の `coordinator/upstream-watch/`。
