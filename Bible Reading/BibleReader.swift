//
//  BibleReader.swift
//  Bible Reading
//
//  Created by Anton Ivanov on 02.01.17.
//  Copyright © 2017 Anton Ivanov. All rights reserved.
//

import Foundation
import GZIP

class BibleReader {
    static func read(filename: String) -> Bible? {
        do {
            if let data = NSData.init(contentsOfFile: filename) {
                if let gunzipped = data.gunzipped() {
                    let msg = try BibleMessage(serializedData: gunzipped)
                    return try BibleProtoConverter.fromMessage(msg: msg)
                } else {
                    NSLog("error during unarchive file \(filename)")
                }
            } else {
                NSLog("error during reading file \(filename)")
            }
        } catch {
            NSLog("error during parse bible \(filename)")
            // TODO
        }
        return nil
    }
}
