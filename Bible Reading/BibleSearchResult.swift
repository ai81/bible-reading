//
//  BibleSearchResult.swift
//  Bible Reading
//
//  Created by Anton Ivanov on 03.01.17.
//  Copyright © 2017 Anton Ivanov. All rights reserved.
//

import Foundation

struct BibleSearchResult {
    init(ref: BibleRef, book: Book, vers: [(Chapter, [Vers])]) {
        self.ref = ref
        self.book = book
        self.vers = vers
    }
    
    let ref: BibleRef
    let book: Book
    let vers: [(Chapter, [Vers])]
}
