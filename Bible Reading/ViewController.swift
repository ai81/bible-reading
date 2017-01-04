//
//  ViewController.swift
//  Bible Reading
//
//  Created by Anton Ivanov on 31.12.16.
//  Copyright © 2016 Anton Ivanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    private var bible: Bible?
    private var date = Date()
    
    private func dateToString(date: Date) -> String {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "d MMMM, EEEE"
        return dateFormatterPrint.string(from: date)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.textView.contentInset = UIEdgeInsets(top: -40, left: 0, bottom: 20, right: 0)
        
        let path = Bundle.main.path(forResource: "bibles/ru.proto", ofType: "gz")
        self.bible = BibleReader.read(filename: path!)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        realod()
    }
    
    private func realod() {
        self.title = dateToString(date: self.date)
        
        do {
            let ref = AllRefsPerDayHolder.findForDay(date: self.date)
        
            let result = try ref.map{ try DayRef(ref: $0) }.map {
                try bible!.find(ref: $0)
            }
            
            // TODO
            self.textView.attributedText = AttributedTextPresentation.present(resultOpt: result, fontSize: 16.0)
            
        } catch let ex {
            NSLog("error during setup text for date \(self.date): \(ex)")
            self.textView.text = ""
        }
    }
}

