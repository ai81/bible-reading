#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$DIR/.."

OUTPUT="$PWD/../Bible Reading/bibles"

python src/zefania_to_proto.py "$PWD/texts/SF_2009-01-20_RUS_RST_(RUSSIAN SYNODAL TRANSLATION).tar.bz2" "$PWD/gen/noncanonical_books_ru.bin" "$OUTPUT/ru.proto"

gzip -f "$OUTPUT/"*.proto
