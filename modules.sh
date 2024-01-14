#!/bin/bash

# モジュール名とURLのペアを配列に格納
declare -a modules=(
    "AdvancedSearch https://github.com/Daniel-KM/Omeka-S-module-AdvancedSearch/releases/download/3.4.15/AdvancedSearch-3.4.15.zip"
    "CustomOntology https://github.com/Daniel-KM/Omeka-s-module-CustomOntology/releases/download/3.4.5.1/CustomOntology-3.4.5.1.zip"
    "Generic https://github.com/Daniel-KM/Omeka-S-module-Generic/releases/download/3.4.45/Generic-3.4.45.zip"
    "Log https://github.com/Daniel-KM/Omeka-S-module-Log/releases/download/3.4.19/Log-3.4.19.zip"
    "UniversalViewer https://github.com/Daniel-KM/Omeka-S-module-UniversalViewer/releases/download/3.6.8/UniversalViewer-3.6.8.zip"
    "BulkImport https://github.com/Daniel-KM/Omeka-S-module-BulkImport/releases/download/3.4.48/BulkImport-3.4.48.zip"
    "EasyAdmin https://github.com/Daniel-KM/Omeka-S-module-EasyAdmin/releases/download/3.4.15/EasyAdmin-3.4.15.zip"
    "IiifServer https://github.com/Daniel-KM/Omeka-S-module-IiifServer/releases/download/3.6.16/IiifServer-3.6.16.zip"
    "MetadataBrowse https://github.com/omeka-s-modules/MetadataBrowse/releases/download/v1.6.0/MetadataBrowse-1.6.0.zip"
    "Next https://github.com/Daniel-KM/Omeka-S-module-Next/releases/download/3.4.47/Next-3.4.47.zip"
    "Reference https://github.com/Daniel-KM/Omeka-S-module-Reference/releases/download/3.4.47/Reference-3.4.47.zip"
    # 他のモジュールもここに追加できます
)

# 配列の各要素に対してループ
for module in "${modules[@]}"; do
    # モジュール名とURLを分割
    read -r MODULE_NAME MODULE_URL <<< "$module"

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
done
