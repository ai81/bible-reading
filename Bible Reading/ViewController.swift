//
//  ViewController.swift
//  Bible Reading
//
//  Created by Anton Ivanov on 31.12.16.
//  Copyright © 2016 Anton Ivanov. All rights reserved.
//

import UIKit
import DatePickerDialog
import FontAwesome_swift
import InAppSettingsKit

class ViewController: UIViewController, IASKSettingsDelegate {
    fileprivate var _appSettingsViewController : IASKAppSettingsViewController? = nil
    @IBOutlet var leftSwipe: UISwipeGestureRecognizer!
    @IBOutlet var rightSwipe: UISwipeGestureRecognizer!
    @IBOutlet weak var showSettingsButton: UIBarButtonItem!
    @IBOutlet weak var changeDate: UIBarButtonItem!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    private var bible: Bible?
    private var date = Date()
    private var setupDateTime = Date()
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
        
        self.activityIndicator.startAnimating()
        
        DispatchQueue.global(qos: .userInitiated).async {
            let path = Bundle.main.path(forResource: "bibles/ru.proto", ofType: "gz")
            self.bible = BibleReader.read(filename: path!)
            DispatchQueue.main.async() {
                self.activityIndicator.stopAnimating()
                self.reload()
                let h = UIScreen.main.nativeBounds.height
                if h == 2436 || h == 1792 || h == 2688 { // yes, dirty hack (((
                    self.textView.contentInset = UIEdgeInsets.init(top: 40, left: 0, bottom: 0, right: 0)
                    self.textView.contentOffset = CGPoint(x: 0, y:-120)
                } else {
                    self.textView.contentOffset = CGPoint(x: 0, y:-60)
                }
                NotificationsSupport.reinstallNotifications()
            }
        }
        
        self.changeDate.image = UIImage.fontAwesomeIcon(name: .calendarO, textColor: UIColor.black, size: CGSize(width: 30, height: 30))
        self.showSettingsButton.image = UIImage.fontAwesomeIcon(name: .sliders, textColor: UIColor.black, size: CGSize(width: 30, height: 30))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reload()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.oldOffset = self.textView.contentOffset
    }
    
    @IBAction func changeDateAction(_ sender: Any) {
        DatePickerDialog().show("Новая дата", doneButtonTitle: "Выбрать", cancelButtonTitle: "Отмена", datePickerMode: .date) {
            (date) -> Void in
            if let dt = date {
                self.date = dt
                self.setupDateTime = Date()
                self.reload()
            }
        }
    }
    
    
    @IBAction func showSettings(_ sender: Any) {
        self.appSettingsViewController().showDoneButton = false;
        self.appSettingsViewController().navigationItem.rightBarButtonItem = nil;
        self.navigationController?.pushViewController(self.appSettingsViewController(), animated: true)
    }
    
    func reload() {
        updateDate()
        
        self.title = dateToString(date: self.date)
        
        do {
            let ref = AllRefsPerDayHolder.findForDay(date: self.date)
        
            var result: [BibleSearchResult]? = nil
            if bible != nil {
                try ref.map{ try DayRef(ref: $0) }.map {
                    result = try bible!.find(ref: $0)
                }
            }
            
            var fontSize = UserDefaults.standard.integer(forKey: "font_size")
            fontSize = fontSize == 0 ? 16 : fontSize
            if self.textView != nil {
                self.textView.attributedText = AttributedTextPresentation.present(date: self.date,
                                                                                  resultOpt: result,
                                                                                  fontSize: CGFloat(fontSize))
                if let o = self.oldOffset {
                    self.textView.contentOffset = o
                }
            }
            
        } catch let ex {
            NSLog("error during setup text for date \(self.date): \(ex)")
        }
    }
    
    private func updateDate() {
        let now = Date()
        let currentComponents = Calendar.current.dateComponents([.year, .month, .day], from: now)
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day], from: self.date)
        let setupDateTimeComponents = Calendar.current.dateComponents([.year, .month, .day], from: self.setupDateTime)
        if ((dateComponents.year == setupDateTimeComponents.year &&
            dateComponents.month == setupDateTimeComponents.month &&
            dateComponents.day == setupDateTimeComponents.day) &&
            (currentComponents.year != dateComponents.year ||
                currentComponents.month != dateComponents.month ||
                currentComponents.day != dateComponents.day)) {
            self.date = now
            self.setupDateTime = now
        }
    }
    
    // MARK: IASKAppSettingsViewControllerDelegate protocol
    func settingsViewControllerDidEnd(_ sender:IASKAppSettingsViewController)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func leftSwipeAction(_ sender: Any) {
        self.date = Calendar.current.date(byAdding: .day, value: 1, to: self.date)!
        self.setupDateTime = Date()
        reload()
    }
    
    @IBAction func rightSwipeAction(_ sender: Any) {
        self.date = Calendar.current.date(byAdding: .day, value: -1, to: self.date)!
        self.setupDateTime = Date()
        reload()
    }
}

