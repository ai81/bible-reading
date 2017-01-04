//
//  Bible.swift
//  Bible Reading
//
//  Created by Anton Ivanov on 02.01.17.
//  Copyright © 2017 Anton Ivanov. All rights reserved.
//

import Foundation

enum BibleSearchErrors: Error {
    case noValidBookWithName(name: String)
    case noValidChapterWithIndex(index: Int)
    case noValidVersWithIndex(index: Int)
}

struct Vers {
    public let index: Int
    public let text: String
}

class Chapter {
    init(index: Int, verses: [Vers]) {
        self.index = index
        self.verses = verses
    }
    
    func find(ref: ChapterRef) throws -> [Vers] {
        var result = [Vers]()
        for range in ref.refs {
            guard range.from <= verses.last!.index && range.from >= verses.first!.index else {
                throw BibleSearchErrors.noValidVersWithIndex(index: range.from)
            }
            if let to = range.to {
                guard to <= verses.last!.index && to >= verses.first!.index else {
                    throw BibleSearchErrors.noValidVersWithIndex(index: to)
                }
            }
            for vers in self.verses {
                if (range.isInside(value: vers.index)) {
                    result.append(vers)
                }
            }
        }
        return result
    }
    
    public let index: Int
    private var verses = [Vers]()
}

class Book {
    init(name: String, chapters: [Int:Chapter]) {
        self.name = name
        self.chapters = chapters
    }
    
    func find(ref: BookRef) throws -> [(Chapter, [Vers])] {
        var result = [(Chapter, [Vers])]()
        for chapter_ref in ref.refs {
            if let chapter = chapters[chapter_ref.index] {
                let part = try chapter.find(ref: chapter_ref)
                result.append((chapter, part))
            } else {
                throw BibleSearchErrors.noValidChapterWithIndex(index: chapter_ref.index)
            }
        }
        
        return result
    }
    
    public let name: String
    private var chapters = [Int:Chapter]()
}

class Bible {
    init(books: [String: Book]) {
        self.books = books
    }
    
    func find(ref: BibleRef) throws -> BibleSearchResult {
        if let book = books[ref.book_name] {
            return try BibleSearchResult(ref: ref, book: book, vers: book.find(ref: ref.book_ref))
        } else {
            throw BibleSearchErrors.noValidBookWithName(name: ref.book_name)
        }
    }
    
    
    private var books = [String: Book]()
}
