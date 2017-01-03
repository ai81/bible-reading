//
//  BibleRef.swift
//  Bible Reading
//
//  Created by Anton Ivanov on 02.01.17.
//  Copyright © 2017 Anton Ivanov. All rights reserved.
//

import Foundation

struct Range: Equatable {
    let from: Int
    let to: Int
    
    public func isInside(value: Int) -> Bool {
        return value >= from && value <= to
    }
}

extension Range {
    static func == (left: Range, right: Range) -> Bool {
        return left.from == right.from && left.to == right.to
    }
}

class ChapterRef: Equatable {
    init(index: Int, ref: String) {
        self.index = index
        // TODO
        self.refs = []
    }
    init(index: Int, refs: [Range]) {
        self.index = index
        self.refs = refs
    }
    
    public let index: Int
    public let refs: [Range]
}

extension ChapterRef {
    static func == (left: ChapterRef, right: ChapterRef) -> Bool {
        return left.index == right.index && left.refs == right.refs
    }
}

class BookRef: Equatable {
    init(ref: String) {
        // TODO
        self.refs = []
    }
    init(refs: [ChapterRef]) {
        self.refs = refs
    }

    public let refs: [ChapterRef]
}

extension BookRef {
    static func == (left: BookRef, right: BookRef) -> Bool {
        return left.refs == right.refs
    }
}

class BibleRef: Equatable {
    init(ref: String) {
        self.original_ref = ref
        // TODO
        self.book_index = 0
        self.book_ref = BookRef(refs: [])
    }
    
    init(book_index: Int, book_ref: BookRef) {
        self.original_ref = ""
        self.book_index = book_index
        self.book_ref = book_ref
    }
    
    public let original_ref: String
    public let book_index: Int
    public let book_ref: BookRef
}

extension BibleRef {
    static func == (left: BibleRef, right: BibleRef) -> Bool {
        return left.book_index == right.book_index && left.book_ref == right.book_ref
    }
}

class DayRef {
    init(ref: String) {
        self.refs = ref.components(separatedBy: ";").map { (c) -> BibleRef in
            BibleRef(ref: c.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines))
        }
    }
    
    init(refs: [BibleRef]) {
        self.refs = refs
    }
    
    public let refs: [BibleRef]
}

