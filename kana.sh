#!/usr/bin/env sh

script_directory=$(dirname "$0")

command awk -f "$script_directory/kana.awk" "$script_directory/kana.txt" "$@"
