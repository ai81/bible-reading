//
//  Bible.swift
//  Bible Reading
//
//  Created by Anton Ivanov on 02.01.17.
//  Copyright © 2017 Anton Ivanov. All rights reserved.
//

import Foundation

enum BibleSearchErrors: Error {
    case noValidBookWithIndex(index: Int)
    case noValidChapterWithIndex(index: Int)
    case noValidVersWithIndex(index: Int)
}

struct Vers {
    let index: Int
    let text: String
}

class Chapter {
    init(verses: [Vers]) {
        self.verses = verses
    }
    
    func find(ref: ChapterRef) throws -> String {
        var result = ""
        for (from, to) in ref.refs {
            guard from <= verses.last!.index && from >= verses.first!.index else {
                throw BibleSearchErrors.noValidVersWithIndex(index: from)
            }
            guard to <= verses.last!.index && to >= verses.first!.index else {
                throw BibleSearchErrors.noValidVersWithIndex(index: to)
            }
            for vers in self.verses {
                if (vers.index >= from || vers.index <= to) {
                    if (!result.isEmpty) {
                      result.append(" ")
                    }
                    result.append(vers.text)
                }
            }
        }
        return result
    }
    
    private var verses = [Vers]()
}

class Book {
    init(name: String, chapters: [Int:Chapter]) {
        self.name = name
        self.chapters = chapters
    }
    
    func find(ref: BookRef) throws -> String {
        var result = ""
        for (chapter_index, chapter_ref) in ref.refs {
            if let chapter = chapters[chapter_index] {
                let part = try chapter.find(ref: chapter_ref)
                result.append(" ")
                result.append(part)
            } else {
                throw BibleSearchErrors.noValidChapterWithIndex(index: chapter_index)
            }
        }
        
        return result
    }
    
    private let name: String
    private var chapters = [Int:Chapter]()
}

class Bible {
    init(books: [Int: Book]) {
        self.books = books
    }
    
    func find(ref: BibleRef) throws -> String {
        if let book = books[ref.book_index] {
            return try book.find(ref: ref.book_ref)
        } else {
            throw BibleSearchErrors.noValidBookWithIndex(index: ref.book_index)
        }
    }
    
    
    private var books = [Int: Book]()
}
