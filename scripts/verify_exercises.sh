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
  "exercises/05_incremental_models"
  "exercises/06_snapshots_scd2"
  "exercises/07_packages_and_dbt_utils"
  "exercises/08_custom_generic_tests"
)

failed_tests=0

for ex in "${exercises[@]}"; do
  echo "==> ${ex}"
  pushd "${ex}" >/dev/null
    # 各演習ディレクトリの profiles.yml を使って実行する
    if [[ ! -f "profiles.yml" ]]; then
      if [[ -f "profiles.yml.example" ]]; then
        cp -n "profiles.yml.example" "profiles.yml"
      else
        echo "ERROR: ${ex}/profiles.yml(.example) が見つかりません" >&2
        exit 2
      fi
    fi

    # packages.yml がある演習は deps を先に実行する
    if [[ -f "packages.yml" ]]; then
      uv run dbt deps
    fi

    uv run dbt seed --profiles-dir .
    uv run dbt run --profiles-dir .

    # snapshots/ がある演習は snapshot も実行（TODO 未完了なら失敗してOK）
    if [[ -d "snapshots" ]]; then
      set +e
      uv run dbt snapshot --profiles-dir .
      snap_status=$?
      set -e
      if [[ $snap_status -ne 0 ]]; then
        echo "EXPECTED-FAIL: ${ex} は TODO 未完了のため dbt snapshot の失敗が想定内です"
      fi
    fi

    # dbtlings は rustlings 風の教材なので、初期状態はテストが落ちる演習があります。
    # ここでは「実行できること（seed/run）」を重視し、test の失敗は許容して先に進めます。
    set +e
    uv run dbt test --profiles-dir .
    status=$?
    set -e
    if [[ $status -ne 0 ]]; then
      echo "EXPECTED-FAIL: ${ex} は TODO 未完了のため dbt test の失敗が想定内です"
      failed_tests=$((failed_tests + 1))
    fi
  popd >/dev/null
done

echo "DONE: すべての演習で dbt seed/run/test を実行しました。"
if [[ $failed_tests -gt 0 ]]; then
  echo "NOTE: dbt test が失敗した演習が ${failed_tests} 個あります（初期状態では想定内）。"
fi
