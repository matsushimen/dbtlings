#!/usr/bin/env bash
set -euo pipefail

if ! command -v uv >/dev/null 2>&1; then
  echo "ERROR: uv が見つかりません。先に uv をインストールして 'uv sync' を実行してください。" >&2
  exit 127
fi

exercises=(
  "exercises/01_project_basics"
  "exercises/02_ref_and_sources"
  "exercises/03_tests_and_docs"
  "exercises/04_macros_and_jinja"
)

for ex in "${exercises[@]}"; do
  echo "==> ${ex}"
  (
    cd "${ex}"
    # ~/.dbt/ を前提にせず、各演習ディレクトリの profiles.yml を使ってローカル完結させる
    if [[ ! -f "profiles.yml" ]]; then
      if [[ -f "profiles.yml.example" ]]; then
        cp -n "profiles.yml.example" "profiles.yml"
      else
        echo "ERROR: ${ex}/profiles.yml(.example) が見つかりません" >&2
        exit 2
      fi
    fi

    uv run dbt seed --profiles-dir .
    uv run dbt run --profiles-dir .

    # dbtlings は rustlings 風の教材なので、初期状態はテストが落ちる演習があります。
    # ここでは「実行できること（seed/run）」を重視し、test の失敗は許容して先に進めます。
    set +e
    uv run dbt test --profiles-dir .
    status=$?
    set -e
    if [[ $status -ne 0 ]]; then
      echo "INFO: ${ex} は TODO 未完了のためテスト失敗が想定内です（学習者が埋めると Green になります）"
    fi
  )
done

echo "OK: すべての演習の dbt seed/run/test が完了しました。"
