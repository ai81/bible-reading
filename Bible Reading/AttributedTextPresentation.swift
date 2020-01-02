//
//  AttributedTextPresentation.swift
//  Bible Reading
//
//  Created by Anton Ivanov on 04.01.17.
//  Copyright © 2017 Anton Ivanov. All rights reserved.
//

import Foundation
import UIKit

class AttributedTextPresentation {
    static func present(date: Date, resultOpt: [BibleSearchResult]?, fontSize: CGFloat) -> NSAttributedString? {
        return resultOpt.map { refs -> NSMutableAttributedString in
            let str = NSMutableAttributedString()
            var fontColor = UIColor.black
            if #available(iOS 13.0, *) {
                fontColor = UIColor.label
            }
            if let holiday = HolidaysHolder.findHoliday(date: date) {
                let titleFontSizeCoeff: CGFloat = holiday.type == .Celebration ? 1.4 : 1.3
                let titleFontColor = holiday.type == .Celebration ? UIColor(red: 184.0 / 255.0, green: 7.0 / 255.0, blue: 10.0/255.0, alpha: 1.0) : fontColor
                str.append(NSAttributedString(string: holiday.name, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: fontSize * titleFontSizeCoeff), NSAttributedString.Key.foregroundColor: titleFontColor]))
                str.append(NSAttributedString(string: "\n\n\n\n"))
            }
            for ref in refs {
                if str.length > 0 {
                    str.append(NSAttributedString(string: "\n\n\n"))
                }
                str.append(NSAttributedString(string: ref.ref.original_ref, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: fontSize * 1.3), NSAttributedString.Key.foregroundColor: UIColor(red: 184.0 / 255.0, green: 7.0 / 255.0, blue: 10.0/255.0, alpha: 1.0)]))
                str.append(NSAttributedString(string: "\n\n"))
                let allVers = ref.vers.flatMap{ $0.1 }
                var isFirstPart = true
                for part in allVers {
                    let attributed = NSMutableAttributedString(string: part.text, attributes: [
                        NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize),
                        NSAttributedString.Key.foregroundColor: fontColor
                    ])
                    if isFirstPart {
                        let firstChar = attributed.mutableString.substring(to: 1)
                        attributed.mutableString.replaceCharacters(in: NSMakeRange(0, 1), with: firstChar.uppercased())
                        isFirstPart = false
                    } else {
                        str.append(NSAttributedString(string: " "))
                    }
                    str.append(attributed)
                }
                let lastChar = str.mutableString.substring(from: str.mutableString.length - 1)
                if lastChar == "," || lastChar == "-" || lastChar == ")"  || lastChar == ":"  || lastChar == ";" {
                    str.mutableString.replaceCharacters(in: NSMakeRange(str.mutableString.length - 1, 1), with: ".")
                }
            }
            return str
        }
    }
}
