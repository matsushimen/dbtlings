## dbtlings

**dbt Core + DuckDB** をハンズオン形式で学べる教材です。  
SQL の基礎（SELECT / JOIN / GROUP BY など）は理解していて、dbt をこれから使い始めたい・ベストプラクティスを身につけたい方向けです。


### 前提条件

- Python 3.10 〜 3.13
- Git
- 任意のエディタ（[VS Code](https://code.visualstudio.com/) 推奨）

### セットアップ

```bash
git clone https://github.com/YOUR_USERNAME/dbtlings.git
cd dbtlings
```

このプロジェクトは [uv](https://github.com/astral-sh/uv) を使用したセットアップを推奨しています。

```bash
# 推奨: Python 3.12
uv python install 3.12
```

### 利用者向け: 演習の進め方（基本）

1. 演習ディレクトリへ移動します（例: `exercises/01_project_basics`）。
2. そのディレクトリの `README.md` を読みます。
3. `uv run dbt debug --profiles-dir .` を実行します。
4. `uv run dbt run --profiles-dir .` → `uv run dbt test --profiles-dir .` を実行します。
5. モデル（`.sql`）や設定（`.yml`）内の `-- TODO:` / `TODO` を埋めて再実行します。

> 補足: 各演習には `profiles.yml.example` が同梱されています。`profiles.yml.example` を `profiles.yml` にコピーしてから `--profiles-dir .` を付けて実行すると、`~/.dbt` を汚さずローカルで完結します。

### 利用者向け: 演習一覧

- **Exercise 01: Project Basics**: `dbt_project.yml` / `ref()` / 基本的なスキーマテスト
- **Exercise 02: Ref & Sources**: `source()` / `ref()` / `relationships` テスト
- **Exercise 03: Tests & Docs**: `description` / `accepted_values` / `dbt docs`
- **Exercise 04: Macros & Jinja**: Macro と Jinja で DRY（初期状態は rustlings 風にテストが落ちる想定）

### 開発者向け: 回帰チェック（開発用）

```bash
./scripts/verify_exercises.sh
```

このスクリプトは **教材の利用者向けではなく、開発者が変更の影響を素早く確認するための回帰チェック**です。  
01〜04 を順に `seed/run/test` します（Exercise 04 のテスト失敗は初期状態では想定内として扱います）。

### リンク

- [dbt Documentation](https://docs.getdbt.com/docs/introduction)
- [dbt-duckdb Documentation](https://github.com/jwills/dbt-duckdb)

### ライセンス

MIT License（詳細は `LICENSE` を参照）
