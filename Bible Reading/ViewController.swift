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
import InAppSettingsKit

class ViewController: UIViewController, IASKSettingsDelegate {
    fileprivate var _appSettingsViewController : IASKAppSettingsViewController? = nil

    @IBOutlet weak var showSettingsButton: UIBarButtonItem!
    @IBOutlet weak var changeDate: UIBarButtonItem!
    @IBOutlet weak var textView: UITextView!
    private var bible: Bible?
    private var date = Date()
    private var oldOffset: CGPoint?
    
    private func dateToString(date: Date) -> String {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "d MMMM, EEEE"
        return dateFormatterPrint.string(from: date)
    }

    func appSettingsViewController() -> IASKAppSettingsViewController {
        if _appSettingsViewController == nil {
            _appSettingsViewController = IASKAppSettingsViewController()
            _appSettingsViewController!.delegate = self
            _appSettingsViewController!.showCreditsFooter = false
            _appSettingsViewController!.title = "Настройки"
        }
        
        return _appSettingsViewController!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "bibles/ru.proto", ofType: "gz")
        self.bible = BibleReader.read(filename: path!)
        
        self.changeDate.image = UIImage.fontAwesomeIcon(name: .calendarO, textColor: UIColor.black, size: CGSize(width: 30, height: 30))
        self.showSettingsButton.image = UIImage.fontAwesomeIcon(name: .sliders, textColor: UIColor.black, size: CGSize(width: 30, height: 30))
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reload()
        reinstallNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.oldOffset = self.textView.contentOffset
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
    
    
    @IBAction func showSettings(_ sender: Any) {
        self.appSettingsViewController().showDoneButton = false;
        self.appSettingsViewController().navigationItem.rightBarButtonItem = nil;
        self.navigationController?.pushViewController(self.appSettingsViewController(), animated: true)
    }
    
    private func reload() {
        if let o = self.oldOffset {
            self.textView.contentOffset = o
        }
        
        self.title = dateToString(date: self.date)
        
        do {
            let ref = AllRefsPerDayHolder.findForDay(date: self.date)
        
            let result = try ref.map{ try DayRef(ref: $0) }.map {
                try bible!.find(ref: $0)
            }
            
            var fontSize = UserDefaults.standard.integer(forKey: "font_size")
            fontSize = fontSize == 0 ? 16 : fontSize
            self.textView.attributedText = AttributedTextPresentation.present(date: self.date,
                                                                              resultOpt: result,
                                                                              fontSize: CGFloat(fontSize))
            
        } catch let ex {
            NSLog("error during setup text for date \(self.date): \(ex)")
            self.textView.text = ""
        }
    }
    
    private func reinstallNotifications() {
        UIApplication.shared.cancelAllLocalNotifications()
        
        let nAboutReading = UserDefaults.standard.object(forKey: "day_reading_notification").map{$0 as! Bool}
        let nHolday0 = UserDefaults.standard.object(forKey: "holiday_0_day").map{$0 as! Bool}
        let nHolday1 = UserDefaults.standard.object(forKey: "holiday_1_day").map{$0 as! Bool}
        let nHolday3 = UserDefaults.standard.object(forKey: "holiday_3_day").map{$0 as! Bool}

        let today = Date()
        var components = Calendar.current.dateComponents([.year, .month, .day], from: today)
        components.hour = 10
        components.minute = 0
        components.second = 0
        components.day = components.day! + 1
        let startNotification = Calendar.current.date(from: components)!

        if nAboutReading ?? true {
            let daysForward = 7
            var date = startNotification
            for _ in 0...daysForward {
                if let ref = AllRefsPerDayHolder.findForDay(date: date) {
                    let notification = UILocalNotification()
                    notification.alertBody = "Чтения дня: " + ref
                    notification.fireDate = date
                    notification.timeZone = TimeZone.current
                    notification.soundName = UILocalNotificationDefaultSoundName
                   UIApplication.shared.scheduleLocalNotification(notification)
                }
                date = Calendar.current.date(byAdding: .day, value: 1, to: date)!
            }
        }
    }
    
    // MARK: IASKAppSettingsViewControllerDelegate protocol
    func settingsViewControllerDidEnd(_ sender:IASKAppSettingsViewController)
    {
        self.dismiss(animated: true, completion: nil)
    }
}

