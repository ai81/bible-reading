#!/usr/bin/env python
# coding=utf-8

import unittest
from zefania_to_proto import process_file
import gen.bible_pb2 as proto


class ProtoBuilderTestCase(unittest.TestCase):
    def testMainCases(self):
        process_file('../../texts/SF_2009-01-20_RUS_RST_(RUSSIAN SYNODAL TRANSLATION).tar.bz2', "/tmp/1.proto")

        with open('/tmp/1.proto', 'r') as content_file:
            bible = proto.BibleMessage()
            bible.ParseFromString(content_file.read())

            self.assertEqual(len(bible.books), 66, "Book size must be 66")
            self.assertEqual(bible.books[0].title, u"Первая книга Моисеева. Бытие", "Match first book name")
            self.assertEqual(bible.books[len(bible.books) - 1].title, u"Откровение Иоанна Богослова", "Match last book name")
            self.assertEqual(bible.books[0].index, 1, "Correct book index")
            self.assertEqual(len(bible.books[0].chapters), 50, "Correct number of chapters in first book")
            self.assertEqual(bible.books[0].chapters[0].number, 1, "Correct number of first chapter")
            self.assertEqual(len(bible.books[0].chapters[0].verses), 31, "Correct number of vers in first chapter")
            self.assertEqual(bible.books[0].chapters[0].verses[0].vnumber, 1, "Correct number of first vers in first chapter")
            self.assertEqual(bible.books[0].chapters[0].verses[0].text, u"В начале сотворил Бог небо и землю.", "Correct text of first vers in first chapter")


if __name__ == '__main__':
    unittest.main()

