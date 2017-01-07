#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$DIR/.."

python src/download_non_canonical_books.py "$PWD/gen/noncanonical_books_ru.bin"