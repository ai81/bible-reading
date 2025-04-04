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
    
    func description() -> String {
        switch type {
        case .Celebration:
            return "торжество " + name
        case .Holiday:
            return "праздник " + name
        default:
            return name
        }
    }
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
        if let holidays = yearToHoldays[year] {
            let day = cal.ordinality(of: .day, in: .year, for: date)
            return holidays[day!]
        } else {
            return nil
        }
    }
    
    static private func strToOrdinal(str: String, year: Int) -> Int {
        let c = str.components(separatedBy: ".")
        let month = Int(c[0])
        let day = Int(c[1])

        let cal = Calendar.current
        let components = DateComponents(year: year, month: month, day: day)
        let date = cal.date(from: components)!
        return cal.ordinality(of: .day, in: .year, for: date)!
    }
    
    private static let dateToHoliday2025: [Int: Holiday] = Dictionary ([

        "1.1": Holiday(type: .Celebration, name: "Пресвятая Богородица Мария"),
        "1.6": Holiday(type: .Celebration, name: "Богоявление"),
        "1.12": Holiday(type: .Holiday, name: "Крещение Господне"),
        "1.25": Holiday(type: .Holiday, name: "Обращение св. Апостола Павла"),
        "2.2": Holiday(type: .Holiday, name: "Сретение Господне"),
        "3.5": Holiday(type: .Holiday, name: "Пепельная Среда"),
        "3.19": Holiday(type: .Celebration, name: "Св. Иосиф, Обручник Пресвятой Девы Марии"),
        "3.25": Holiday(type: .Celebration, name: "Благовещение Господне"),
        "4.13": Holiday(type: .Celebration, name: "Вербное Воскресенье"),
        "4.20": Holiday(type: .Celebration, name: "Пасха. Светлое Христово Воскресение"),
        "5.14": Holiday(type: .Holiday, name: "Св. Матфий, Евангелист"),
        "5.29": Holiday(type: .Celebration, name: "Вознесение Господне"),
        "5.31": Holiday(type: .Holiday, name: "Посещение Пресвятой Девой Марией Елизаветы"),
        "6.8": Holiday(type: .Celebration, name: "Сошествие Святого Духа. Пятидесятница"),
        "6.13": Holiday(type: .MandatoryMemory, name: "Св. Антоний Падуанский, свящ. и Уч. Ц."),
        "6.15": Holiday(type: .Celebration, name: "Персвятая Троица"),
        "6.22": Holiday(type: .Celebration, name: "Пресвятые Тело и Кровь Господни"),
        "6.24": Holiday(type: .Celebration, name: "Рождество св. Иоанна Крестителя"),
        "6.27": Holiday(type: .Celebration, name: "Святейшее Сердце Иисуса"),
        "6.29": Holiday(type: .Celebration, name: "свв. Пётр и Павел, Апостолы"),
        "7.22": Holiday(type: .Holiday, name: "Св. Мария Магдалина"),
        "7.25": Holiday(type: .Holiday, name: "Св. Иаков, Апостол"),
        "8.6": Holiday(type: .Holiday, name: "Преображение Господне"),
        "8.15": Holiday(type: .Celebration, name: "Успение Пресвятой Богородицы"),
        "9.8": Holiday(type: .Holiday, name: "Рождество Пресвятой Девы Марии"),
        "9.14": Holiday(type: .Holiday, name: "Воздвижение Святого Креста"),
        "9.29": Holiday(type: .Holiday, name: "Свв. Михаил, Гавриил и Рафаил, архангелы"),
        "10.18": Holiday(type: .Holiday, name: "Св. Лука, Евангелист"),
        "10.28": Holiday(type: .Holiday, name: "Свв. Симон и Иуда Фаддей, Апостолы"),
        "11.1": Holiday(type: .Celebration, name: "Все Святые"),
        "11.2": Holiday(type: .MandatoryMemory, name: "Поминовение всех Усопших верных"),
        "11.23": Holiday(type: .Holiday, name: "Господь наш Иисус Христос, Царь Вселенной"),
        "12.1": Holiday(type: .Celebration, name: "св. Андрей Первозванный, Апостол"),
        "12.8": Holiday(type: .Celebration, name: "Непорочное Зачатие Пресвятой Девы Марии"),
        "12.25": Holiday(type: .Celebration, name: "Рождество Христово"),
        "12.26": Holiday(type: .Holiday, name: "Св. Стефан, Первомученник"),
        "12.27": Holiday(type: .Holiday, name: "Св. Иоанн, Апостол и Евангелист"),
        "12.28": Holiday(type: .Holiday, name: "Святое Семейство - Иисус, Мария и Иосиф"),
    ].map { (HolidaysHolder.strToOrdinal(str: $0, year: 2025), $1)    })

    private static let dateToHoliday2024: [Int: Holiday] = Dictionary ([

        "1.1": Holiday(type: .Celebration, name: "Пресвятая Богородица Мария"),
        "1.6": Holiday(type: .Celebration, name: "Богоявление"),
        "1.7": Holiday(type: .Holiday, name: "Крещение Господне"),
        "1.25": Holiday(type: .Holiday, name: "Обращение св. Апостола Павла"),
        "2.2": Holiday(type: .Holiday, name: "Сретение Господне"),
        "2.14": Holiday(type: .Holiday, name: "Пепельная Среда"),
        "3.19": Holiday(type: .Celebration, name: "Св. Иосиф, Обручник Пресвятой Девы Марии"),
        "3.24": Holiday(type: .Celebration, name: "Вербное Воскресенье"),
        "3.31": Holiday(type: .Celebration, name: "Пасха. Светлое Христово Воскресение"),
        "4.8": Holiday(type: .Celebration, name: "Благовещение Господне"),
        "4.25": Holiday(type: .Holiday, name: "Св. Марк, Евангелист"),
        "5.9": Holiday(type: .Celebration, name: "Вознесение Господне"),
        "5.19": Holiday(type: .Celebration, name: "Сошествие Святого Духа. Пятидесятница"),
        "5.26": Holiday(type: .Celebration, name: "Персвятая Троица"),
        "5.31": Holiday(type: .Holiday, name: "Посещение Пресвятой Девой Марией Елизаветы"),
        "6.2": Holiday(type: .Celebration, name: "Пресвятые Тело и Кровь Господни"),
        "6.7": Holiday(type: .Celebration, name: "Святейшее Сердце Иисуса"),
        "6.24": Holiday(type: .Celebration, name: "Рождество св. Иоанна Крестителя"),
        "6.29": Holiday(type: .Celebration, name: "свв. Пётр и Павел, Апостолы"),
        "7.22": Holiday(type: .Holiday, name: "Св. Мария Магдалина"),
        "7.25": Holiday(type: .Holiday, name: "Св. Иаков, Апостол"),
        "8.6": Holiday(type: .Holiday, name: "Преображение Господне"),
        "8.10": Holiday(type: .Holiday, name: "Св. Лаврентий, диакон и муч."),
        "8.15": Holiday(type: .Celebration, name: "Успение Пресвятой Богородицы"),
        "8.24": Holiday(type: .Holiday, name: "Св. Варфоломей, Апостол"),
        "9.14": Holiday(type: .Holiday, name: "Воздвижение Святого Креста"),
        "9.21": Holiday(type: .Holiday, name: "Св. Матфей, Апостол и Евангелист"),
        "10.18": Holiday(type: .Holiday, name: "Св. Лука, Евангелист"),
        "10.28": Holiday(type: .Holiday, name: "Свв. Симон и Иуда, Апостолы"),
        "11.1": Holiday(type: .Celebration, name: "Все Святые"),
        "11.2": Holiday(type: .MandatoryMemory, name: "Поминовение всех усопших верных"),
        "11.9": Holiday(type: .Holiday, name: "Освящение Латеранской Базилики"),
        "11.24": Holiday(type: .Holiday, name: "Господь наш Иисус Христос, Царь Вселенной"),
        "11.30": Holiday(type: .Celebration, name: "св. Андрей, Апостол"),
        "12.8": Holiday(type: .Celebration, name: "Непорочное Зачатие Пресвятой Девы Марии"),
        "12.25": Holiday(type: .Celebration, name: "Рождество Христово"),
        "12.26": Holiday(type: .Holiday, name: "Св. Стефан, Первомученник"),
        "12.27": Holiday(type: .Holiday, name: "Св. Иоанн, Апостол и Евангелист"),
        "12.28": Holiday(type: .Holiday, name: "Свв. младенцы Вифлеемские, мученики"),
        "12.29": Holiday(type: .Holiday, name: "Святое Семейство - Иисус, Мария и Иосиф"),
    ].map { (HolidaysHolder.strToOrdinal(str: $0, year: 2024), $1)    })
    
    private static let dateToHoliday2023: [Int: Holiday] = Dictionary ([

        "1.1": Holiday(type: .Celebration, name: "Пресвятая Богородица Мария"),
        "1.6": Holiday(type: .Celebration, name: "Богоявление"),
        "1.8": Holiday(type: .Holiday, name: "Крещение Господне"),
        "1.25": Holiday(type: .Holiday, name: "Обращение св. Апостола Павла"),
        "2.2": Holiday(type: .Holiday, name: "Сретение Господне"),
        "2.22": Holiday(type: .Holiday, name: "Пепельная Среда"),
        "3.20": Holiday(type: .Celebration, name: "Св. Иосиф, Обручник Пресвятой Девы Марии"),
        "3.25": Holiday(type: .Celebration, name: "Благовещение Господне"),
        "4.2": Holiday(type: .Celebration, name: "Вербное Воскресенье"),
        "4.9": Holiday(type: .Celebration, name: "Пасха. Светлое Христово Воскресение"),
        "4.25": Holiday(type: .Holiday, name: "Св. Марк, Евангелист"),
        "5.18": Holiday(type: .Celebration, name: "Вознесение Господне"),
        "5.28": Holiday(type: .Celebration, name: "Сошествие Святого Духа. Пятидесятница"),
        "5.31": Holiday(type: .Holiday, name: "Посещение Пресвятой Девой Марией Елизаветы"),
        "6.4": Holiday(type: .Celebration, name: "Персвятая Троица"),
        "6.11": Holiday(type: .Celebration, name: "Пресвятые Тело и Кровь Господни"),
        "6.16": Holiday(type: .Celebration, name: "Святейшее Сердце Иисуса"),
        "6.24": Holiday(type: .Celebration, name: "Рождество св. Иоанна Крестителя"),
        "6.29": Holiday(type: .Celebration, name: "свв. Пётр и Павел, Апостолы"),
        "7.22": Holiday(type: .Holiday, name: "Св. Мария Магдалина"),
        "7.25": Holiday(type: .Holiday, name: "Св. Иаков, Апостол"),
        "8.6": Holiday(type: .Holiday, name: "Преображение Господне"),
        "8.10": Holiday(type: .Holiday, name: "Св. Лаврентий, диакон и муч."),
        "8.15": Holiday(type: .Celebration, name: "Успение Пресвятой Богородицы"),
        "8.24": Holiday(type: .Holiday, name: "Св. Варфоломей, Апостол"),
        "9.8": Holiday(type: .Holiday, name: "Рождество Пресвятой Девы Марии"),
        "9.14": Holiday(type: .Holiday, name: "Воздвижение Святого Креста"),
        "9.21": Holiday(type: .Holiday, name: "Св. Матфей, Апостол и Евангелист"),
        "9.29": Holiday(type: .Holiday, name: "Свв. Архангелы Михаил, Гавриил и Рафаил"),
        "10.18": Holiday(type: .Holiday, name: "Св. Лука, Евангелист"),
        "10.28": Holiday(type: .Holiday, name: "Свв. Симон и Иуда, Апостолы"),
        "11.1": Holiday(type: .Celebration, name: "Все Святые"),
        "11.2": Holiday(type: .MandatoryMemory, name: "Поминовение всех усопших верных"),
        "11.9": Holiday(type: .Holiday, name: "Освящение Латеранской Базилики"),
        "11.26": Holiday(type: .Holiday, name: "Господь наш Иисус Христос, Царь Вселенной"),
        "11.30": Holiday(type: .Celebration, name: "св. Андрей, Апостол"),
        "12.8": Holiday(type: .Celebration, name: "Непорочное Зачатие Пресвятой Девы Марии"),
        "12.25": Holiday(type: .Celebration, name: "Рождество Христово"),
        "12.26": Holiday(type: .Holiday, name: "Св. Стефан, Первомученник"),
        "12.27": Holiday(type: .Holiday, name: "Св. Иоанн, Апостол и Евангелист"),
        "12.28": Holiday(type: .Holiday, name: "Свв. младенцы Вифлеемские, мученики"),
        "12.31": Holiday(type: .Holiday, name: "Святое Семейство - Иисус, Мария и Иосиф"),
    ].map { (HolidaysHolder.strToOrdinal(str: $0, year: 2023), $1)    })

    private static let dateToHoliday2022: [Int: Holiday] = Dictionary ([
        
        "1.1": Holiday(type: .Celebration, name: "Пресвятая Богородица Мария"),
        "1.6": Holiday(type: .Celebration, name: "Богоявление"),
        "1.9": Holiday(type: .Holiday, name: "Крещение Господне"),
        "1.25": Holiday(type: .Holiday, name: "Обращение св. Апостола Павла"),
        "2.2": Holiday(type: .Holiday, name: "Сретение Господне"),
        "2.22": Holiday(type: .Holiday, name: "Кафедра св. Апостола Петра"),
        "3.2": Holiday(type: .Holiday, name: "Пепельная Среда"),
        "3.19": Holiday(type: .Celebration, name: "Св. Иосиф, Обручник Пресвятой Девы Марии"),
        "3.25": Holiday(type: .Celebration, name: "Благовещение Господне"),
        "4.10": Holiday(type: .Celebration, name: "Вербное Воскресенье"),
        "4.17": Holiday(type: .Celebration, name: "Пасха. Светлое Христово Воскресение"),
        "5.6": Holiday(type: .Holiday, name: "Св. Георгий Победоносец"),
        "5.14": Holiday(type: .Holiday, name: "Св. Матвей Апостол"),
        "5.26": Holiday(type: .Celebration, name: "Вознесение Господне"),
        "5.31": Holiday(type: .Holiday, name: "Посещение Пресвятой Девой Марией Елизаветы"),
        "6.5": Holiday(type: .Celebration, name: "Сошествие Святого Духа. Пятидесятница"),
        "6.12": Holiday(type: .Celebration, name: "Персвятая Троица"),
        "6.19": Holiday(type: .Celebration, name: "Пресвятые Тело и Кровь Господни"),
        "6.23": Holiday(type: .Celebration, name: "Рождество св. Иоанна Крестителя"),
        "6.24": Holiday(type: .Celebration, name: "Святейшее Сердце Иисуса"),
        "6.29": Holiday(type: .Celebration, name: "свв. Пётр и Павел, Апостолы"),
        "7.22": Holiday(type: .Holiday, name: "Св. Мария Магдалина"),
        "7.25": Holiday(type: .Holiday, name: "Св. Иаков Ст., Апостол"),
        "8.6": Holiday(type: .Holiday, name: "Преображение Господне"),
        "8.10": Holiday(type: .Holiday, name: "Св. Лаврентий, диакон и муч."),
        "8.15": Holiday(type: .Celebration, name: "Успение Пресвятой Богородицы"),
        "8.24": Holiday(type: .Holiday, name: "Св. Варфоломей, Апостол"),
        "9.8": Holiday(type: .Holiday, name: "Рождество Пресвятой Богородицы"),
        "9.14": Holiday(type: .Holiday, name: "Воздвижение Святого Креста"),
        "9.21": Holiday(type: .Holiday, name: "Св. Матфей, Апостол и Евангелист"),
        "9.29": Holiday(type: .Holiday, name: "Свв. Архангелы Михаил, Гавриил и Рафаил"),
        "10.18": Holiday(type: .Holiday, name: "Св. Лука, Евангелист"),
        "10.28": Holiday(type: .Holiday, name: "Свв. Симон и Иуда Фаддей, Апостолы"),
        "11.1": Holiday(type: .Celebration, name: "Все Святые"),
        "11.2": Holiday(type: .MandatoryMemory, name: "Поминовение всех Усопших верных"),
        "11.9": Holiday(type: .Holiday, name: "Освящение Латеранской Базилики"),
        "11.20": Holiday(type: .Holiday, name: "Господь наш Иисус Христос, Царь Вселенной"),
        "11.30": Holiday(type: .Celebration, name: "св. Андрей Первозванный, Апостол"),
        "12.8": Holiday(type: .Celebration, name: "Непорочное Зачатие Пресвятой Девы Марии"),
        "12.25": Holiday(type: .Celebration, name: "Рождество Христово"),
        "12.26": Holiday(type: .Holiday, name: "Св. Стефан, Первомученник"),
        "12.27": Holiday(type: .Holiday, name: "Св. Иоанн, Апостол и Евангелист"),
        "12.28": Holiday(type: .Holiday, name: "Свв. Невинные младенцы Вифлеемские"),
        "12.30": Holiday(type: .Holiday, name: "Святое Семейство - Иисус, Мария и Иосиф"),

        ].map { (HolidaysHolder.strToOrdinal(str: $0, year: 2022), $1)    })

    private static let dateToHoliday2021: [Int: Holiday] = Dictionary ([
        
        "1.1": Holiday(type: .Celebration, name: "Пресвятая Богородица Мария"),
        "1.6": Holiday(type: .Celebration, name: "Богоявление"),
        "1.10": Holiday(type: .Holiday, name: "Крещение Господне"),
        "1.25": Holiday(type: .Holiday, name: "Обращение св. Апостола Павла"),
        "2.2": Holiday(type: .Holiday, name: "Сретение Господне"),
        "2.17": Holiday(type: .Holiday, name: "Пепельная Среда"),
        "2.22": Holiday(type: .Holiday, name: "Кафедра св. Апостола Петра"),
        "3.19": Holiday(type: .Celebration, name: "Св. Иосиф, Обручник Пресвятой Девы Марии"),
        "3.25": Holiday(type: .Celebration, name: "Благовещение Господне"),
        "3.28": Holiday(type: .Celebration, name: "Вербное Воскресенье"),
        "4.4": Holiday(type: .Celebration, name: "Пасха. Светлое Христово Воскресение"),
        "5.6": Holiday(type: .Holiday, name: "Св. Георгий Победоносец"),
        "5.13": Holiday(type: .Celebration, name: "Вознесение Господне"),
        "5.14": Holiday(type: .Holiday, name: "Св. Матфей Апостол"),
        "5.23": Holiday(type: .Celebration, name: "Сошествие Святого Духа. Пятидесятница"),
        "5.30": Holiday(type: .Celebration, name: "Персвятая Троица"),
        "5.31": Holiday(type: .Holiday, name: "Посещение Пресвятой Девой Марией Елизаветы"),
        "6.6": Holiday(type: .Celebration, name: "Пресвятые Тело и Кровь Господни"),
        "6.11": Holiday(type: .Celebration, name: "Святейшее Сердце Иисуса"),
        "6.24": Holiday(type: .Celebration, name: "Рождество св. Иоанна Крестителя"),
        "6.29": Holiday(type: .Celebration, name: "свв. Пётр и Павел, Апостолы"),
        "7.3": Holiday(type: .Holiday, name: "Св. Фома Апостол"),
        "7.22": Holiday(type: .Holiday, name: "Св. Мария Магдалина"),
        "8.6": Holiday(type: .Holiday, name: "Преображение Господне"),
        "8.10": Holiday(type: .Holiday, name: "Св. Лаврентий, диакон и муч."),
        "8.15": Holiday(type: .Celebration, name: "Успение Пресвятой Богородицы"),
        "8.24": Holiday(type: .Holiday, name: "Св. Варфоломей, Апостол"),
        "9.8": Holiday(type: .Holiday, name: "Рождество Пресвятой Богородицы"),
        "9.14": Holiday(type: .Holiday, name: "Воздвижение Святого Креста"),
        "9.21": Holiday(type: .Holiday, name: "Св. Матфей, Апостол и Евангелист"),
        "9.29": Holiday(type: .Holiday, name: "Свв. Архангелы Михаил, Гавриил и Рафаил"),
        "10.18": Holiday(type: .Holiday, name: "Св. Лука, Евангелист"),
        "10.28": Holiday(type: .Holiday, name: "Свв. Симон и Иуда Фаддей, Апостолы"),
        "11.1": Holiday(type: .Celebration, name: "Все Святые"),
        "11.9": Holiday(type: .Holiday, name: "Освящение Латеранской Базилики"),
        "11.21": Holiday(type: .Holiday, name: "Господь наш Иисус Христос, Царь Вселенной"),
        "11.30": Holiday(type: .Celebration, name: "св. Андрей, Апостол"),
        "12.8": Holiday(type: .Celebration, name: "Непорочное Зачатие Пресвятой Девы Марии"),
        "12.25": Holiday(type: .Celebration, name: "Рождество Христово"),
        "12.26": Holiday(type: .Holiday, name: "Святое Семейство - Иисус, Мария и Иосиф"),
        "12.27": Holiday(type: .Holiday, name: "Св. Иоанн, Апостол и Евангелист"),
        "12.28": Holiday(type: .Holiday, name: "Свв. Невинные младенцы Вифлеемские"),
        
        ].map { (HolidaysHolder.strToOrdinal(str: $0, year: 2021), $1)    })

    private static let dateToHoliday2020: [Int: Holiday] = Dictionary ([
        
        "1.1": Holiday(type: .Celebration, name: "Пресвятая Богородица Мария"),
        "1.6": Holiday(type: .Celebration, name: "Богоявление"),
        "1.12": Holiday(type: .Holiday, name: "Крещение Господне"),
        "1.25": Holiday(type: .Holiday, name: "Обращение св. Апостола Павла"),
        "2.2": Holiday(type: .Holiday, name: "Сретение Господне"),
        "2.14": Holiday(type: .Holiday, name: "свв. Кирилл и Мефодий"),
        "2.22": Holiday(type: .Holiday, name: "Кафедра св. Апостола Петра"),
        "2.26": Holiday(type: .Holiday, name: "Пепельная Среда"),
        "3.19": Holiday(type: .Celebration, name: "Св. Иосиф, Обручник Пресвятой Девы Марии"),
        "3.25": Holiday(type: .Celebration, name: "Благовещение Господне"),
        "4.5": Holiday(type: .Celebration, name: "Вербное Воскресенье"),
        "4.12": Holiday(type: .Celebration, name: "Пасха. Светлое Христово Воскресение"),
        "4.19": Holiday(type: .Celebration, name: "Божьего Милосердия"),
        "5.6": Holiday(type: .Holiday, name: "Св. Георгий Победоносец"),
        "5.14": Holiday(type: .Holiday, name: "Св. Матфей Апостол"),
        "5.21": Holiday(type: .Celebration, name: "Вознесение Господне"),
        "5.31": Holiday(type: .Celebration, name: "Сошествие Святого Духа. Пятидесятница"),
        "6.7": Holiday(type: .Celebration, name: "Персвятая Троица"),
        "6.14": Holiday(type: .Celebration, name: "Пресвятые Тело и Кровь Господни"),
        "6.19": Holiday(type: .Celebration, name: "Святейшее Сердце Иисуса"),
        "6.24": Holiday(type: .Celebration, name: "Рождество св. Иоанна Крестителя"),
        "6.29": Holiday(type: .Celebration, name: "свв. Первоверховные апостолы Пётр и Павел"),
        "7.3": Holiday(type: .Holiday, name: "Св. Фома Апостол"),
        "7.25": Holiday(type: .Holiday, name: "Св. Иаков Ст., Апостол"),
        "8.6": Holiday(type: .Holiday, name: "Преображение Господне"),
        "8.10": Holiday(type: .Holiday, name: "Св. Лаврентий, диакон и муч."),
        "8.15": Holiday(type: .Celebration, name: "Успение Пресвятой Богородицы"),
        "8.24": Holiday(type: .Holiday, name: "Св. Варфоломей, Апостол"),
        "9.8": Holiday(type: .Holiday, name: "Рождество Пресвятой Богородицы"),
        "9.14": Holiday(type: .Holiday, name: "Воздвижение Святого Креста Господня"),
        "9.21": Holiday(type: .Holiday, name: "Св. Матфей, Апостол"),
        "9.29": Holiday(type: .Holiday, name: "свв. Архангелы Михаил, Гавриил и Рафаил"),
        "10.28": Holiday(type: .Holiday, name: "Свв. Симон и Иуда Фаддей, Апостолы"),
        "11.1": Holiday(type: .Celebration, name: "Все Святые"),
        "11.9": Holiday(type: .Holiday, name: "Освящение Латеранской Базилики"),
        "11.22": Holiday(type: .Holiday, name: "Господь наш Иисус Христос, Царь Вселенной"),
        "11.30": Holiday(type: .Celebration, name: "св. Андрей Первозванный, Апостол"),
        "12.8": Holiday(type: .Celebration, name: "Непорочное Зачатие Пресвятой Девы Марии"),
        "12.25": Holiday(type: .Celebration, name: "Рождество Христово"),
        "12.26": Holiday(type: .Holiday, name: "Св. Стефан, Первомученик"),
        "12.27": Holiday(type: .Holiday, name: "Святое Семейство - Иисус, Мария и Иосиф"),
        "12.28": Holiday(type: .Holiday, name: "Свв. Невинные младенцы Вифлеемские"),
        
        ].map { (HolidaysHolder.strToOrdinal(str: $0, year: 2020), $1)    })

    private static let dateToHoliday2019: [Int: Holiday] = Dictionary ([
        
        "1.1": Holiday(type: .Celebration, name: "Пресвятая Богородица Мария"),
        "1.6": Holiday(type: .Celebration, name: "Богоявление"),
        "1.13": Holiday(type: .Holiday, name: "Крещение Господне"),
        "1.25": Holiday(type: .Holiday, name: "Обращение св. Апостола Павла"),
        "2.2": Holiday(type: .Holiday, name: "Сретение Господне"),
        "2.14": Holiday(type: .Holiday, name: "свв. Кирилл и Мефодий"),
        "2.22": Holiday(type: .Holiday, name: "Кафедра св. Апостола Петра"),
        "3.6": Holiday(type: .Holiday, name: "Пепельная Среда"),
        "3.19": Holiday(type: .Celebration, name: "Св. Иосиф, Обручник Пресвятой Девы Марии"),
        "3.25": Holiday(type: .Celebration, name: "Благовещение Господне"),
        "4.14": Holiday(type: .Celebration, name: "Вербное Воскресенье"),
        "4.21": Holiday(type: .Celebration, name: "Пасха. Светлое Христово Воскресение"),
        "4.28": Holiday(type: .Celebration, name: "Божьего Милосердия"),
        "5.6": Holiday(type: .Holiday, name: "Св. Георгий Победоносец"),
        "5.14": Holiday(type: .Holiday, name: "Св. Матфей Апостол"),
        "5.30": Holiday(type: .Celebration, name: "Вознесение Господне"),
        "6.9": Holiday(type: .Celebration, name: "Сошествие Святого Духа. Пятидесятница"),
        "6.16": Holiday(type: .Celebration, name: "Персвятая Троица"),
        "6.23": Holiday(type: .Celebration, name: "Пресвятые Тело и Кровь Господни"),
        "6.24": Holiday(type: .Celebration, name: "Рождество св. Иоанна Крестителя"),
        "6.28": Holiday(type: .Celebration, name: "Святейшее Сердце Иисуса"),
        "6.29": Holiday(type: .Celebration, name: "свв. Первоверховные апостолы Пётр и Павел"),
        "7.3": Holiday(type: .Holiday, name: "Св. Фома Апостол"),
        "7.25": Holiday(type: .Holiday, name: "Св. Иаков Ст., Апостол"),
        "8.6": Holiday(type: .Holiday, name: "Преображение Господне"),
        "8.10": Holiday(type: .Holiday, name: "Св. Лаврентий, диакон и муч."),
        "8.15": Holiday(type: .Celebration, name: "Успение Пресвятой Богородицы"),
        "8.24": Holiday(type: .Holiday, name: "Св. Варфоломей, Апостол"),
        "9.14": Holiday(type: .Holiday, name: "Воздвижение Святого Креста Господня"),
        "9.29": Holiday(type: .Holiday, name: "свв. Архангелы Михаил, Гавриил и Рафаил"),
        "9.21": Holiday(type: .Holiday, name: "Св. Матфей, Апостол"),
        "10.18": Holiday(type: .Holiday, name: "Св. Лука Евангелист"),
        "10.28": Holiday(type: .Holiday, name: "Свв. Симон и Иуда Фаддей, Апостолы"),
        "11.1": Holiday(type: .Celebration, name: "Все Святые"),
        "11.9": Holiday(type: .Holiday, name: "Освящение Латеранской Базилики"),
        "11.24": Holiday(type: .Holiday, name: "Господь наш Иисус Христос, Царь Вселенной"),
        "11.30": Holiday(type: .Celebration, name: "св. Андрей Первозванный, Апостол"),
        "12.9": Holiday(type: .Celebration, name: "Непорочное Зачатие Пресвятой Девы Марии"),
        "12.25": Holiday(type: .Celebration, name: "Рождество Христово"),
        "12.26": Holiday(type: .Holiday, name: "Св. Стефан, Первомученик"),
        "12.27": Holiday(type: .Holiday, name: "Св. Иоанн, Апостол"),
        "12.28": Holiday(type: .Holiday, name: "Свв. Невинные младенцы Вифлеемские"),
        "12.30": Holiday(type: .Holiday, name: "Святое Семейство - Иисус, Мария и Иосиф"),
        
        ].map { (HolidaysHolder.strToOrdinal(str: $0, year: 2019), $1)    })

    private static let dateToHoliday2018: [Int: Holiday] = Dictionary ([
        
        "1.1": Holiday(type: .Celebration, name: "Пресвятая Богородица Мария"),
        "1.6": Holiday(type: .Celebration, name: "Богоявление"),
        "1.7": Holiday(type: .Holiday, name: "Крещение Господне"),
        "2.2": Holiday(type: .Holiday, name: "Сретение Господне"),
        "2.14": Holiday(type: .Holiday, name: "Пепельная Среда"),
        "3.19": Holiday(type: .Celebration, name: "Св. Иосиф, Обручник Пресвятой Девы Марии"),
        "3.25": Holiday(type: .Celebration, name: "Вербное Воскресенье"),
        "4.1": Holiday(type: .Celebration, name: "Пасха. Светлое Христово Воскресение"),
        "4.8": Holiday(type: .Celebration, name: "Божьего Милосердия"),
        "4.9": Holiday(type: .Celebration, name: "Благовещение Господне"),
        "5.10": Holiday(type: .Celebration, name: "Вознесение Господне"),
        "5.20": Holiday(type: .Celebration, name: "Сошествие Святого Духа. Пятидесятница"),
        "5.27": Holiday(type: .Celebration, name: "Персвятая Троица"),
        "6.3": Holiday(type: .Celebration, name: "Пресвятые Тело и Кровь Господни"),
        "6.8": Holiday(type: .Celebration, name: "Святейшее Сердце Иисуса"),
        "6.24": Holiday(type: .Celebration, name: "Рождество св. Иоанна Крестителя"),
        "6.29": Holiday(type: .Celebration, name: "свв. Первоверховные апостолы Пётр и Павел"),
        "8.6": Holiday(type: .Celebration, name: "Преображение Господне"),
        "8.15": Holiday(type: .Celebration, name: "Успение Пресвятой Богородицы"),
        "9.8": Holiday(type: .Holiday, name: "Рождество Пресвятой Богородицы"),
        "9.14": Holiday(type: .Holiday, name: "Воздвижение Святого Креста Господня"),
        "9.29": Holiday(type: .Holiday, name: "свв. Архангелы Михаил, Гавриил и Рафаил"),
        "11.1": Holiday(type: .Celebration, name: "Все Святые"),
        "11.25": Holiday(type: .Holiday, name: "Господь наш Иисус Христос, Царь Вселенной"),
        "11.30": Holiday(type: .Celebration, name: "св. Андрей Первозванный, Апостол"),
        "12.8": Holiday(type: .Celebration, name: "Непорочное Зачатие Пресвятой Девы Марии"),
        "12.25": Holiday(type: .Celebration, name: "Рождество Христово"),
        "12.30": Holiday(type: .Holiday, name: "Святое Семейство - Иисус, Мария и Иосиф"),
        
        ].map { (HolidaysHolder.strToOrdinal(str: $0, year: 2018), $1)    })
    
    private static let dateToHoliday2017: [Int: Holiday] = Dictionary ([
        
        "1.1": Holiday(type: .Celebration, name: "Пресвятая Богородица Мария"),
        "1.6": Holiday(type: .Celebration, name: "Богоявление"),
        "1.8": Holiday(type: .Holiday, name: "Крещение Господне"),
        "2.2": Holiday(type: .Holiday, name: "Сретение Господне"),
        "3.1": Holiday(type: .Holiday, name: "Пепельная Среда"),
        "3.20": Holiday(type: .Celebration, name: "Св. Иосиф, Обручник Пресвятой Девы Марии"),
        "3.25": Holiday(type: .Celebration, name: "Благовещение Господне"),
        "4.9": Holiday(type: .Celebration, name: "Вербное Воскресенье"),
        "4.16": Holiday(type: .Celebration, name: "Пасха. Светлое Христово Воскресение"),
        "4.23": Holiday(type: .Celebration, name: "Божьего Милосердия"),
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
        "12.31": Holiday(type: .Holiday, name: "Святое Семейство - Иисус, Мария и Иосиф"),
        
        ].map { (HolidaysHolder.strToOrdinal(str: $0, year: 2017), $1)    })
    
    private static let yearToHoldays = [
        2017: dateToHoliday2017,
        2018: dateToHoliday2018,
        2019: dateToHoliday2019,
        2020: dateToHoliday2020,
        2021: dateToHoliday2021,
        2022: dateToHoliday2022,
        2023: dateToHoliday2023,
        2024: dateToHoliday2024,
        2025: dateToHoliday2025
    ]
}
