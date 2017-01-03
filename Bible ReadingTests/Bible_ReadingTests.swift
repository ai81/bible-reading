//
//  Bible_ReadingTests.swift
//  Bible ReadingTests
//
//  Created by Anton Ivanov on 31.12.16.
//  Copyright © 2016 Anton Ivanov. All rights reserved.
//

import XCTest
@testable import Bible_Reading

class Bible_ReadingTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testBookReadingAndSearching() throws {
        let path = Bundle.main.path(forResource: "bibles/ru.proto", ofType: "gz")
        let bible = BibleReader.read(filename: path!)
        let ref = BibleRef(book_index: 1, book_ref: BookRef(refs: [(1, ChapterRef(refs: [(1, 2), (3, 4)]))]))
        print(try bible!.find(ref: ref))
    }
    
}
