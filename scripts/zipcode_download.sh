#!/usr/bin/env bash

# 前回取得したzipファイルを削除
# zipファイルをダウンロードして解凍まで実施。
rbenv exec bundle exec rails runner Tasks::JapanPost.download_zipcodes_file
