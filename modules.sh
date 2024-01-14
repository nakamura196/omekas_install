#!/bin/bash

# 引数チェック
if [ "$#" -lt 2 ]; then
    echo "Usage: $0 module_name module_url [module_name module_url ...]"
    exit 1
fi

# 二つの引数ずつ処理
while [ "$#" -gt 0 ]; do
    MODULE_NAME=$1
    MODULE_URL=$2

    echo "Processing $MODULE_NAME from $MODULE_URL"

    # 既存のモジュールディレクトリを削除
    rm -rf "$MODULE_NAME"

    # モジュールのzipファイルをダウンロード
    wget "$MODULE_URL"

    # zipファイルの名前を取得
    ZIP_FILE=$(basename "$MODULE_URL")

    # zipファイルを解凍し、その後削除
    unzip "$ZIP_FILE"
    rm "$ZIP_FILE"

    # 次のモジュールへ
    shift 2
done
