//
//  NotificationsSupport.swift
//  Bible Reading
//
//  Created by Anton Ivanov on 06.01.17.
//  Copyright © 2017 Anton Ivanov. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications
    
class NotificationsSupport {
    public static func reinstallNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        
        let nAboutReading = UserDefaults.standard.object(forKey: "day_reading_notification").map{$0 as! Bool}
        let nHolyday0 = UserDefaults.standard.object(forKey: "holiday_0_day").map{$0 as! Bool}
        let nHolyday1 = UserDefaults.standard.object(forKey: "holiday_1_day").map{$0 as! Bool}
        let nHolyday3 = UserDefaults.standard.object(forKey: "holiday_3_day").map{$0 as! Bool}
        
        let today = Date()
        var components = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: today)
        
        components.hour = 10
        components.minute = 0
        components.second = 0
        components.day = components.day! + 1
        // components.second = components.second! + 10 // for testing
        
        let daysForward = 14
        
        for _ in 0...daysForward {
            let date = Calendar.current.date(from: components)!
            let datePlusDay = Calendar.current.date(byAdding: .day, value: 1, to: date)!
            let datePlus3Day = Calendar.current.date(byAdding: .day, value: 3, to: date)!
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
                let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)

                let center = UNUserNotificationCenter.current()
                let content = UNMutableNotificationContent()
                content.body = text
                content.sound = UNNotificationSound.default
                
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                center.add(request)
            }
            components.day = components.day! + 1
        }
    }
}
