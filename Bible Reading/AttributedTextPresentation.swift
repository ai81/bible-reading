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
    static func present(resultOpt: [BibleSearchResult]?, fontSize: CGFloat) -> NSAttributedString? {
        return resultOpt.map { refs -> NSMutableAttributedString in
            let str = NSMutableAttributedString()
            for ref in refs {
                if str.length > 0 {
                    str.append(NSAttributedString(string: "\n\n\n"))
                }
                str.append(NSAttributedString(string: ref.ref.original_ref, attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: fontSize * 1.3), NSForegroundColorAttributeName: UIColor.init(colorLiteralRed: 184.0 / 255.0, green: 7.0 / 255.0, blue: 10.0/255.0, alpha: 1.0)]))
                str.append(NSAttributedString(string: "\n\n"))
                let allVers = ref.vers.flatMap{ $0.1 }
                var isFirstPart = true
                for part in allVers {
                    if isFirstPart {
                        isFirstPart = false
                    } else {
                        str.append(NSAttributedString(string: " "))
                    }
                    str.append(NSAttributedString(string: part.text, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: fontSize)]))
                }
            }
            return str
        }
    }
}
