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
        let ref = BibleRef(book_name: "Первая книга Моисеева. Бытие", book_ref: BookRef(refs: [ChapterRef(index:1, refs:[Range(from: 1, to: 2), Range(from: 4, to: 5)])]))
        let result = try bible!.find(ref: ref)
        XCTAssertEqual(result.book.name, "Первая книга Моисеева. Бытие", "wrong book")
        XCTAssertEqual(result.ref, ref, "wrong ref")
        XCTAssertEqual(result.vers[0].1[3].index, 5, "wrong last verts index")
        print(result)
    }
    
    func testCorrectRefsParsing() throws {
        let r1 = try BibleRef(ref: "Быт 10, 1-10")
        XCTAssertEqual(r1.book_name, "Первая книга Моисеева. Бытие")
        XCTAssertEqual(r1.book_ref.refs.count, 1)
        XCTAssertEqual(r1.book_ref.refs[0].index, 10)
        XCTAssertEqual(r1.book_ref.refs[0].refs.count, 1)
        XCTAssertEqual(r1.book_ref.refs[0].refs[0].from, 1)
        XCTAssertEqual(r1.book_ref.refs[0].refs[0].to, 10)
        
        XCTAssertEqual(try BibleRef(ref: "Быт 10, 1 - 10 "), try BibleRef(ref: "Быт 10,1-10"))
        
        let r2 = try BibleRef(ref: "Соф 2,3.3,12-4,13")
        XCTAssertEqual(r2.book_ref.refs.count, 3)
        XCTAssertEqual(r2.book_ref.refs[0].index, 2)
        XCTAssertEqual(r2.book_ref.refs[0].refs.count, 1)
        XCTAssertEqual(r2.book_ref.refs[0].refs[0].from, 3)
        XCTAssertEqual(r2.book_ref.refs[0].refs[0].to, 3)
        XCTAssertEqual(r2.book_ref.refs[1].index, 3)
        XCTAssertEqual(r2.book_ref.refs[1].refs.count, 1)
        XCTAssertEqual(r2.book_ref.refs[1].refs[0].from, 12)
        XCTAssertNil(r2.book_ref.refs[1].refs[0].to)
        XCTAssertEqual(r2.book_ref.refs[2].index, 4)
        XCTAssertEqual(r2.book_ref.refs[2].refs.count, 1)
        XCTAssertEqual(r2.book_ref.refs[2].refs[0].from, 1)
        XCTAssertEqual(r2.book_ref.refs[2].refs[0].to, 13)

        XCTAssertEqual(try BibleRef(ref: "Соф 2,3.3,12-4,13"), try BibleRef(ref: "Соф 2,3;3,12-4,13"))
    }
}
