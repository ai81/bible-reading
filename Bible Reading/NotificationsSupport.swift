//
//  NotificationsSupport.swift
//  Bible Reading
//
//  Created by Anton Ivanov on 06.01.17.
//  Copyright © 2017 Anton Ivanov. All rights reserved.
//

import Foundation
import UIKit

class NotificationsSupport {
    public static func reinstallNotifications() {
        UIApplication.shared.cancelAllLocalNotifications()
        
        let nAboutReading = UserDefaults.standard.object(forKey: "day_reading_notification").map{$0 as! Bool}
        let nHolyday0 = UserDefaults.standard.object(forKey: "holiday_0_day").map{$0 as! Bool}
        let nHolyday1 = UserDefaults.standard.object(forKey: "holiday_1_day").map{$0 as! Bool}
        let nHolyday3 = UserDefaults.standard.object(forKey: "holiday_3_day").map{$0 as! Bool}
        
        let today = Date()
        var components = Calendar.current.dateComponents([.year, .month, .day], from: today)
        components.hour = 10
        components.minute = 0
        components.second = 0
        components.day = components.day! + 1
        
        let daysForward = 14
        var date = Calendar.current.date(from: components)!
        var datePlusDay = Calendar.current.date(byAdding: .day, value: 1, to: date)!
        var datePlus3Day = Calendar.current.date(byAdding: .day, value: 3, to: date)!
        
        for _ in 0...daysForward {
            var text = String()
            if nHolyday0 ?? true {
                if let holiday = HolidaysHolder.findHoliday(date: date) {
                    text += "Сегодня " + holiday.description()
                }
            }
            if nHolyday1 ?? true {
                if let holiday = HolidaysHolder.findHoliday(date: datePlusDay) {
                    if !text.isEmpty {
                        text += "\n"
                    }
                    text += "Завтра " + holiday.description()
                }
            }
            if nHolyday3 ?? true {
                if let holiday = HolidaysHolder.findHoliday(date: datePlus3Day) {
                    if !text.isEmpty {
                        text += "\n"
                    }
                    let dateFormatterPrint = DateFormatter()
                    dateFormatterPrint.dateFormat = "d MMMM, EEEE"
                    text += "Через 3 дня " + dateFormatterPrint.string(from: datePlus3Day) + ": " + holiday.description()
                }
            }
            if nAboutReading ?? true {
                if let ref = AllRefsPerDayHolder.findForDay(date: date) {
                    if !text.isEmpty {
                        text += "\n"
                    }
                    text += "Чтения дня на сегодня: " + ref
                }
            }
            if !text.isEmpty {
                let notification = UILocalNotification()
                notification.alertBody = text
                notification.fireDate = date
                notification.timeZone = TimeZone.current
                notification.soundName = UILocalNotificationDefaultSoundName
                UIApplication.shared.scheduleLocalNotification(notification)
            }
            date = Calendar.current.date(byAdding: .day, value: 1, to: date)!
            datePlusDay = Calendar.current.date(byAdding: .day, value: 1, to: datePlusDay)!
            datePlus3Day = Calendar.current.date(byAdding: .day, value: 1, to: datePlus3Day)!
        }
    }
}
