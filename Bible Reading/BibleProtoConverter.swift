//
//  BibleProtoConverter.swift
//  Bible Reading
//
//  Created by Anton Ivanov on 02.01.17.
//  Copyright © 2017 Anton Ivanov. All rights reserved.
//

import Foundation

enum BibleReadingErrors : Error {
    case invalidBibleProtoVersion
    case invalidBookProtoVersion
    case invalidChapterProtoVersion
    case invalidVersProtoVersion
}

class BibleProtoConverter {
    private static let BIBLE_PROTO_VERSION: Int32 = 1
    private static let BOOK_PROTO_VERSION: Int32 = 1
    private static let CHAPTER_PROTO_VERSION: Int32 = 1
    private static let VERS_PROTO_VERSION: Int32 = 1
    
    static func fromMessage(msg: BibleProto.BibleMessage) throws -> Bible {
        guard msg.version == BIBLE_PROTO_VERSION else {
           throw BibleReadingErrors.invalidBibleProtoVersion
        }
        var books = [Int: Book]()
        for book_msg in msg.books {
            guard book_msg.version == BOOK_PROTO_VERSION else {
                throw BibleReadingErrors.invalidBookProtoVersion
            }
            var chapters = [Int:Chapter]()
            for chapter_msg in book_msg.chapters {
                guard chapter_msg.version == CHAPTER_PROTO_VERSION else {
                    throw BibleReadingErrors.invalidChapterProtoVersion
                }
                var verses = [Vers]()
                for vers_msg in chapter_msg.verses {
                    guard vers_msg.version == VERS_PROTO_VERSION else {
                        throw BibleReadingErrors.invalidVersProtoVersion
                    }
                    verses.append(Vers(index: Int(vers_msg.vnumber), text: vers_msg.text))
                }
                verses.sort(by: { (v1, v2) -> Bool in
                    v1.index < v2.index
                })
                let chapter_index = Int(chapter_msg.number)
                let chapter = Chapter(index:chapter_index, verses: verses)
                chapters[chapter_index] = chapter
            }
            let book = Book(name: book_msg.title, chapters: chapters)
            books[Int(book_msg.index)] = book
        }
        return Bible(books: books)
    }
}
