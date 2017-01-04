//
//  ViewController.swift
//  Bible Reading
//
//  Created by Anton Ivanov on 31.12.16.
//  Copyright © 2016 Anton Ivanov. All rights reserved.
//

import UIKit
import RMDateSelectionViewController
import FontAwesome_swift

class ViewController: UIViewController {
    @IBOutlet weak var changeDate: UIBarButtonItem!
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
        
        self.changeDate.image = UIImage.fontAwesomeIcon(name: .calendarO, textColor: UIColor.black, size: CGSize(width: 30, height: 30))
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reload()
    }
    
    @IBAction func changeDateAction(_ sender: Any) {
        let selectAction = RMAction<UIDatePicker>(title: "Выбрать", style: RMActionStyle.done) { controller in
            self.date = controller.contentView.date
            self.reload()
        }
        let cancelAction = RMAction<UIDatePicker>(title: "Отмена", style: RMActionStyle.cancel) { _ in
        }
        let actionController = RMDateSelectionViewController(style: RMActionControllerStyle.white, title: "Новая дата", message: nil, select: selectAction, andCancel: cancelAction)!;
        
        let datePicker = actionController.datePicker!
        datePicker.datePickerMode = UIDatePickerMode.date
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        datePicker.minimumDate = dateStringFormatter.date(from: "2017-01-01")
        datePicker.maximumDate = dateStringFormatter.date(from: "2017-12-31")
        
        present(actionController, animated: true, completion: nil)
    }
    
    private func reload() {
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

