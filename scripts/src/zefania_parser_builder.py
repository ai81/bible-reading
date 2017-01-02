#!/usr/bin/env python

from xml.sax import ContentHandler, handler, make_parser


def build_parser():
    parser = make_parser()
    processor = ZefaniaHandler()
    parser.setContentHandler(processor)
    parser.setFeature(handler.feature_external_ges, False)
    return parser, processor


class Book:
    def __init__(self, index):
        self.title = ""
        self.index = index
        self.chapters = []


class Chapter:
    def __init__(self, number):
        self.number = number
        self.verses = []


class Vers:
    def __init__(self, vnumber):
        self.vnumber = vnumber
        self.text = ""


class ZefaniaHandler(ContentHandler):
    def __init__(self):
        ContentHandler.__init__(self)
        self.allBooks = []
        self.book = None
        self.chapter = None
        self.vers = None
        self.inCaption = False

    def startElement(self, name, attrs):
        name = name.lower()
        if name == 'vers' and self.chapter is not None:
            vers = Vers(int(attrs.get('vnumber', '')))
            self.chapter.verses.append(vers)
            self.vers = vers
        elif name == 'biblebook':
            self.book = Book(int(attrs.get('bnumber', '')))
        elif name == 'chapter' and self.book is not None:
            chapter = Chapter(int(attrs.get('cnumber', '')))
            self.book.chapters.append(chapter)
            self.chapter = chapter
        elif name == 'caption' and self.book is not None:
            self.inCaption = True

    def endElement(self, name):
        name = name.lower()
        if name == 'vers':
            self.vers = None
        elif name == 'biblebook':
            self.allBooks.append(self.book)
            self.book = None
        elif name == 'chapter':
            self.chapter = None
        elif name == 'caption':
            self.inCaption = False

    def characters(self, content):
        if self.inCaption:
            self.book.title += content
        elif self.vers is not None:
            self.vers.text += content



