//
//  BibleRef.swift
//  Bible Reading
//
//  Created by Anton Ivanov on 02.01.17.
//  Copyright © 2017 Anton Ivanov. All rights reserved.
//

import Foundation

enum BibleRefErrors: Error {
    case UnknownBookName(name: String)
    case DashInWrongPosition(str: String)
    case RangeNotClosed
    case NoChapter
    case NoRef
    case WrongCharacter(str: String)
}

struct Range: Equatable {
    let from: Int
    let to: Int?
    
    public func isInside(value: Int) -> Bool {
        return value >= from && value <= to ?? Int.max
    }
}

extension Range {
    static func == (left: Range, right: Range) -> Bool {
        return left.from == right.from && left.to == right.to
    }
}

class ChapterRef: Equatable {
    init(index: Int, ref: String) throws {
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
    init(ref: String) throws {
        self.refs = try BookRef.parseRef(ref: ref)
    }
    init(refs: [ChapterRef]) {
        self.refs = refs
    }

    public let refs: [ChapterRef]
}

extension BookRef {
    private static let zeroCode = Int("0".unicodeScalars.first!.value)
    private static let commaCode = ",".unicodeScalars.first!.value
    private static let semicolonCode = ";".unicodeScalars.first!.value
    private static let dotCode = ".".unicodeScalars.first!.value
    private static let dashCode = "-".unicodeScalars.first!.value
    private static let spaceCode = " ".unicodeScalars.first!.value
    
    struct Context {
        var lastRef: Int = 0
        var lastChapter: Int = 0
        var rangeStartRef: Int = 0
        var rangeStartChapter: Int = 0
        var chapters = [ChapterRef]()
        
        mutating func reset() {
            lastRef = 0
            rangeStartRef = 0
            rangeStartChapter = 0
        }
        
        mutating func startRange() {
            rangeStartChapter = lastChapter
            rangeStartRef = lastRef
            lastRef = 0
        }
        
         mutating func buildRanges() throws {
            if rangeStartRef != 0 && rangeStartChapter != 0 {
                if lastRef == 0 {
                    throw BibleRefErrors.RangeNotClosed
                }
                if lastChapter != 0 {
                    if lastChapter != rangeStartChapter { // rang withg 2 chapters
                        chapters.append(ChapterRef(index: rangeStartChapter, refs: [Range(from:rangeStartRef, to:nil)]))
                        chapters.append(ChapterRef(index: lastChapter, refs: [Range(from: 1, to:lastRef)]))
                    } else { // same chapters in range
                        chapters.append(ChapterRef(index: rangeStartChapter, refs: [Range(from:rangeStartRef, to:lastRef)]))
                    }
                } else { // range without chatper in right side
                    chapters.append(ChapterRef(index: rangeStartChapter, refs: [Range(from:rangeStartRef, to:lastRef)]))
                }
            } else { // just one ref
                if lastChapter == 0 {
                    throw BibleRefErrors.NoChapter
                }
                if lastRef == 0 {
                    throw BibleRefErrors.NoRef
                }
                chapters.append(ChapterRef(index: lastChapter, refs: [Range(from:lastRef, to:lastRef)]))
            }
            reset()
        }
    }
    
    static func parseRef(ref: String) throws -> [ChapterRef] {
        var context = Context()
        
        var lastNumber: Int = 0
        
        // add dot for simplify parsing
        for char in (ref + ".").trimmingCharacters(in: CharacterSet.whitespaces).unicodeScalars {
            if CharacterSet.decimalDigits.contains(char) {
                lastNumber = lastNumber * 10 + (Int(char.value) - zeroCode)
            } else {
                if char.value == commaCode {
                    context.lastChapter = lastNumber
                    lastNumber = 0
                } else if char.value == dashCode {
                    context.lastRef = lastNumber
                    lastNumber = 0
                    if (context.lastChapter == 0 || context.lastRef == 0) {
                        throw BibleRefErrors.DashInWrongPosition(str: ref)
                    }
                    context.startRange()
                } else if char.value == dotCode || char.value == semicolonCode {
                    context.lastRef = lastNumber
                    lastNumber = 0
                    try context.buildRanges()
                } else if char.value != spaceCode {
                    throw BibleRefErrors.WrongCharacter(str: ref)
                }
            }
        }
        return context.chapters
    }
    
}

extension BookRef {
    static func == (left: BookRef, right: BookRef) -> Bool {
        return left.refs == right.refs
    }
}

class BibleRef: Equatable {
    init(ref: String) throws {
        self.original_ref = ref
        let (book_name_opt, rest) = BibleRef.extractBookName(ref: ref)
        if let book_name = book_name_opt {
            self.book_name = book_name
            self.book_ref = try BookRef(ref: rest)
        } else {
            throw BibleRefErrors.UnknownBookName(name: ref)
        }
    }
    
    init(book_name: String, book_ref: BookRef) {
        self.original_ref = ""
        self.book_name = book_name
        self.book_ref = book_ref
    }
    
    public let original_ref: String
    public let book_name: String
    public let book_ref: BookRef
}

extension BibleRef {
    // return book name + remaining
    static func extractBookName(ref: String) -> (String?, String) {
        let components: [String] = ref.components(separatedBy: " ").filter { !$0.isEmpty }
        if let book_name = AbbrevToBookName.map(abbrev: components.isEmpty ? "" : components[0]) {
            return (book_name, components.dropFirst().joined(separator: " "))
        }
        if let book_name = AbbrevToBookName.map(abbrev: components.count < 2 ? "" : components[0] + " " + components[1]) {
            return (book_name, components.dropFirst().dropFirst().joined(separator: " "))
        }
        return (nil, ref)
    }
}

extension BibleRef {
    static func == (left: BibleRef, right: BibleRef) -> Bool {
        return left.book_name == right.book_name && left.book_ref == right.book_ref
    }
}

class DayRef {
    init(ref: String) throws {
        self.refs = try ref.components(separatedBy: ";").map { (c) -> BibleRef in
            try BibleRef(ref: c.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines))
        }
    }
    
    init(refs: [BibleRef]) {
        self.refs = refs
    }
    
    public let refs: [BibleRef]
}

