//
//  BibleRef.swift
//  Bible Reading
//
//  Created by Anton Ivanov on 02.01.17.
//  Copyright © 2017 Anton Ivanov. All rights reserved.
//

import Foundation

class ChapterRef {
    init(ref: String) {
        // TODO
        self.refs = []
    }
    init(refs: [(Int, Int)]) {
        self.refs = refs
    }
    
    let refs: [(Int, Int)]
}

class BookRef {
    init(ref: String) {
        // TODO
        self.refs = []
    }
    init(refs: [(Int, ChapterRef)]) {
        self.refs = refs
    }

    let refs: [(Int, ChapterRef)]
}

class BibleRef {
    init(ref: String) {
        // TODO
        self.book_index = 0
        self.book_ref = BookRef(refs: [])
    }
    
    init(book_index: Int, book_ref: BookRef) {
        self.book_index = book_index
        self.book_ref = book_ref
    }
    
    let book_index: Int
    let book_ref: BookRef
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
    
    let refs: [BibleRef]
}

