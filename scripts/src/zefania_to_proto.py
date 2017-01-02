#!/usr/bin/env python

import gen.bible_pb2 as proto
from zefania_parser_builder import build_parser
import sys
import tarfile

def process(name, from_file, to_filename):
    proto_bible = proto.BibleMessage()

    proto_bible.version = 1

    (parser, processor) = build_parser()

    parser.parse(from_file)

    add_to_proto(proto_bible, processor)

    with open(to_filename, 'w') as output:
        output.write(proto_bible.SerializeToString())

    print(name + ' - ' + str(len(processor.allBooks)) + '\n')


def add_to_proto(proto_bible, processor):
    for book in processor.allBooks:
        book_proto = proto_bible.books.add()
        book_proto.version = 1
        book_proto.index = book.index
        book_proto.title = book.title
        for chapter in book.chapters:
            chapter_proto = book_proto.chapters.add()
            chapter_proto.version = 1
            chapter_proto.number = chapter.number
            for vers in chapter.verses:
                vers_proto = chapter_proto.verses.add()
                vers_proto.version = 1
                vers_proto.vnumber = vers.vnumber
                vers_proto.text = vers.text


def process_file(from_filename, to_filename):
    tar = tarfile.open(from_filename, 'r:bz2')
    try:
        xmls = filter(lambda s: s.endswith('.xml'), tar.getnames())
        if len(xmls) != 1:
            raise Exception('Can\'t find only one file with extention xml in', tar.getnames())
        process(xmls[0], tar.extractfile(xmls[0]), to_filename)
    except Exception as ex:
        print('Can\'t process file ' + from_filename + ' with error: ' + str(ex))
    finally:
        tar.close()

if __name__ == '__main__':
    process_file(sys.argv[1], sys.argv[2])
