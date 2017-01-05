//
//  HolidaysHolder.swift
//  Bible Reading
//
//  Created by Anton Ivanov on 06.01.17.
//  Copyright © 2017 Anton Ivanov. All rights reserved.
//

import Foundation

enum HolidayType {
    case Celebration
    case Holiday
    case MandatoryMemory
    case OptionalMemory
}

struct Holiday {
    let type: HolidayType
    let name: String
}

extension Dictionary {
    init(_ pairs: [Element]) {
        self.init()
        for (k, v) in pairs {
            self[k] = v
        }
    }
}

class HolidaysHolder {
    static public func findHoliday(date: Date) -> Holiday? {
        let cal = Calendar.current
        let year = cal.component(Calendar.Component.year, from: date)
        if year != 2017 {
            return nil
        }
        let day = cal.ordinality(of: .day, in: .year, for: date)
        return dateToHoliday2017[day!]
    }
    
    static private func strToOrdinal(str: String) -> Int {
        let c = str.components(separatedBy: ".")
        let month = Int(c[0])
        let day = Int(c[1])

        let cal = Calendar.current
        let components = DateComponents(year: 2017, month: month, day: day)
        let date = cal.date(from: components)!
        return cal.ordinality(of: .day, in: .year, for: date)!
    }
    
    private static let dateToHoliday2017: [Int: Holiday] = Dictionary ([
        
        "1.1": Holiday(type: .Celebration, name: "Пресвятая Богородица Мария"),
        "1.6": Holiday(type: .Celebration, name: "Богоявление"),
        "1.10": Holiday(type: .Holiday, name: "Крещение Господне"),
        "2.2": Holiday(type: .Holiday, name: "Сретение Господне"),
        "3.1": Holiday(type: .Holiday, name: "Пепельная Среда"),
        "3.20": Holiday(type: .Celebration, name: "Св. Иосиф, Обручник Пресвятой Девы Марии"),
        "3.25": Holiday(type: .Celebration, name: "Благовещение Господне"),
        "4.9": Holiday(type: .Celebration, name: "Вербное Воскресенье"),
        "4.16": Holiday(type: .Celebration, name: "Пасха. Светлое Христово Воскресение"),
        "4.23": Holiday(type: .Celebration, name: "Торжество Божьего Милосердия"),
        "5.25": Holiday(type: .Celebration, name: "Вознесение Господне"),
        "6.4": Holiday(type: .Celebration, name: "Сошествие Святого Духа. Пятидесятница"),
        "6.11": Holiday(type: .Celebration, name: "Персвятая Троица"),
        "6.18": Holiday(type: .Celebration, name: "Пресвятые Тело и Кровь Христа"),
        "6.23": Holiday(type: .Celebration, name: "Святейшее Сердце Иисуса"),
        "6.24": Holiday(type: .Celebration, name: "Рождество св. Иоанна Крестителя"),
        "6.29": Holiday(type: .Celebration, name: "свв. Первоверховные апп. Пётр и Павел"),
        "8.6": Holiday(type: .Celebration, name: "Преображение Господне"),
        "8.15": Holiday(type: .Celebration, name: "Успение Пресвятой Богородицы"),
        "9.8": Holiday(type: .Holiday, name: "Рождество Пресвятой Богородицы"),
        "9.14": Holiday(type: .Holiday, name: "Воздвижение Святого Креста Господня"),
        "9.29": Holiday(type: .Holiday, name: "свв. Архангелы Михаил, Гавриил и Рафаил"),
        "11.1": Holiday(type: .Celebration, name: "Все Святые"),
        "11.26": Holiday(type: .Holiday, name: "Господь наш Иисус Христос, Царь Вселенной"),
        "11.30": Holiday(type: .Celebration, name: "св. Андрей Первозванный, Апостол"),
        "12.8": Holiday(type: .Celebration, name: "Непорочное Зачатие Пресвятой Девы Марии"),
        "12.25": Holiday(type: .Celebration, name: "Рождество Христово"),
        "12.30": Holiday(type: .Holiday, name: "Святое Семейство - Иисус, Мария и Иосиф"),
        
        ].map { (HolidaysHolder.strToOrdinal(str: $0), $1)    })
    
}
