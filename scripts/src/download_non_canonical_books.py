#!/usr/bin/env python
# coding=utf-8

from BeautifulSoup import BeautifulSoup as bs
from zefania_parser_builder import Book,Chapter,Vers
from urllib2 import urlopen, HTTPError
import gen.bible_pb2 as proto
from zefania_to_proto import add_to_proto
import sys

def parse_chapter(stream, index):
    """Input: http stream, chapter index; Output: Chapter class"""
    chapter = Chapter(index)
    content = stream.read()
    stream.close()
    soup = bs(content.decode("windows-1251"))
    for p in soup.findAll("p"):
        for sup in p.findAll("sup"):
            vers = Vers(int(sup.string))
            vers.text = sup.nextSibling.string
            chapter.verses.append(vers)
    return chapter


def download_book(source):
    """Input: BookSource class; Output: Book class"""
    index = 1
    book = Book(0)
    book.title = source.name
    while True:
        url = prepare_url(source.url_template, index)
        print("  download " + url + " ...")
        try:
            stream = urlopen(url)
        except HTTPError, e:
            if e.code == 404:
                break
            raise e
        chapter = parse_chapter(stream, index)
        book.chapters.append(chapter)
        index += 1
    return book


def prepare_url(template, chapter):
    return template.replace("NUM", str(chapter))


class BookSource:
    def __init__(self, url_template, name):
       self.url_template = url_template
       self.name = name

books = [
    BookSource("http://days.pravoslavie.ru/Bible/B_towNUM.htm", u"Книга Товита"),
    BookSource("http://days.pravoslavie.ru/Bible/B_iudif'NUM.htm", u"Книга Иудифи"),
    BookSource("http://days.pravoslavie.ru/Bible/B_premNUM.htm", u"Книга премудрости Соломона"),
    BookSource("http://days.pravoslavie.ru/Bible/B_sirNUM.htm", u"Книга премудрости Иисуса, сына Сирахова"),
    BookSource("http://days.pravoslavie.ru/Bible/B_posl_ierNUM.htm", u"Послание Иеремии"),
    BookSource("http://days.pravoslavie.ru/Bible/B_warNUM.htm", u"Книга пророка Варуха"),
    BookSource("http://days.pravoslavie.ru/Bible/B_1_makNUM.htm", u"Первая книга Маккавейская"),
    BookSource("http://days.pravoslavie.ru/Bible/B_2_makNUM.htm", u"Вторая книга Маккавейская"),
    BookSource("http://days.pravoslavie.ru/Bible/B_3_makNUM.htm", u"Третья книга Маккавейская"),
    BookSource("http://days.pravoslavie.ru/Bible/B_2_ezdNUM.htm", u"Вторая книга Ездры"),
    BookSource("http://days.pravoslavie.ru/Bible/B_3_ezdNUM.htm", u"Третья книга Ездры")
]

if __name__ == "__main__":
    to_filename = sys.argv[1]
    non_canonical_books = []
    proto_bible = proto.BibleMessage()
    proto_bible.version = 1
    for book in books:
        print("Start processing book: " + book.name)
        non_canonical_books.append(download_book(book))
    add_to_proto(proto_bible, non_canonical_books)
    with open(to_filename, 'w') as output:
        output.write(proto_bible.SerializeToString())
