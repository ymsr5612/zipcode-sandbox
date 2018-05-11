#!/usr/bin/env bash

# CSVファイルを読み込んで、DBに保存します。
# レコードが存在しない場合は新規登録し、存在する場合は更新
rbenv exec bundle exec rails runner Tasks::JapanPost.update_zipcodes
