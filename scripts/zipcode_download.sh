#!/usr/bin/env bash

# 前回取得したzipファイルを削除
# zipファイルをダウンロードして解凍まで実施。
rbenv exec bundle exec rails runner Tasks::JapanPost.download_zipcodes_file

if [ -e public/KEN_ALL.CSV ]; then
  date +"%Y-%m-%d %H:%M:%S  ファイルのダウンロードに成功しました。"
else
  date +"%Y-%m-%d %H:%M:%S  ファイルのダウンロードに失敗しました。"
fi
