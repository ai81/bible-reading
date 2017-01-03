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
        let ref = BibleRef(book_index: 1, book_ref: BookRef(refs: [ChapterRef(index:1, refs:[Range(from: 1, to: 2), Range(from: 4, to: 5)])]))
        let result = try bible!.find(ref: ref)
        XCTAssertEqual(result.book.name, "Первая книга Моисеева. Бытие", "wrong book")
        XCTAssertEqual(result.ref, ref, "wrong ref")
        XCTAssertEqual(result.vers[0].1[3].index, 5, "wrong last verts index")
        print(result)
    }
    
}
