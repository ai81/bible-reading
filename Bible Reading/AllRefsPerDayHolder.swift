//
//  AllRefsPerDayHolder.swift
//  Bible Reading
//
//  Created by Anton Ivanov on 04.01.17.
//  Copyright © 2017 Anton Ivanov. All rights reserved.
//

import Foundation

class AllRefsPerDayHolder {
    static public func findForDay(date: Date) -> String? {
        let cal = Calendar.current
        let year = cal.component(Calendar.Component.year, from: date)
        if year != 2017 {
            return nil
        }
        let day = cal.ordinality(of: .day, in: .year, for: date)
        return day.flatMap { (day) -> String? in
            refs2107[day - 1]
        }
    }
    
    static public let refs2107 = [
        "Числ 6,22-27;Пс 67, 2-3.5.6.8;Гал 4,4-7;Лк 2,16-21", // 1 января
        "1 Ин 2,22-28; Пс 98,1.2-4;Ин 1,19-28",
        "1 Ин 2,29-3,6;Пс 98,1.3-6; Ин 1,29-34",
        "1 Ин 3,7-10;Пс 98, 1.7-8.9;Ин 1,35-42",
        "1 Ин 3, 11-21;Пс 100,1-2.3.4.5;Ин 1,43-51",
        "Ис 60,1-6;Пс 72,1-13;Еф 3,2-3.5-6;Мф 2,1-12",
        "1 Ин 3,22-4,6;Пс 2,7-8.10-11;Мф 4,12-17.23-25",
        "Ис 42,1-4.6-7;Пс 29,1-2.3-4.9-10;Деян 10,34-38;Мф 3,13-17",
        "Евр 1,1-6;Пс 97,1-2.6-7;Мк 1,14-20",
        "Евр 2,5-12;Пс 8,2.5-9;Мк 1,21-28",
        
        "Евр 2,14-18;Пс 105, 1-9;Мк 1,29-39", // 11 января
        "Евр 3,7-14;Пс 95,6-11;Мк 1,40-45",
        "Евр 4,1-5.11;Пс 78,3-4.6-8;Мк 2,1-12",
        "Евр 4,12-16;Пс 19,8-10.15;Мк 2,13-17",
        "Ис 49,3.5-6;Пс 40,2.4.7-10;1 Кор 1,1-3;Ин 1,29-34",
        "Евр 5,1-10;Пс 110,1-4;Мк 2,18-22",
        "Евр 6,10-20;Пс 111,1-2.4-5.9-10;Мк 2,23-28",
        "Евр 7,1-3.15-17;Пс 110, 1-4;Мк 3,1-6",
        "Евр 7,25-8,6;Пс 40,7-10.17;Мк 3,7-12",
        "Евр 8,6-13;Пс 85,8.10-14;Мк 3,13-19",
        
        "Евр 9,2-3.11-14;Пс 47,2-3.6-9;Мк 3,20-21", // 21 января
        "Ис 8,23-9,3;Пс 27,1.4.13-14;1 Кор 1,10-13.17;Мф 4,12-23",
        "Евр 9,15.24-28;Пс 98,1-6;Мк 3,22-30",
        "Евр 10,1-10;Пс 40,2-4.7-8.10-11;Мк 3,31-35",
        "Деян 22,3-16;Пс 117,1.2;Мк 16,15-18",
        "2 Тим 1,1-8;Пс 96,1-3.7-8.10;Лк 10,1-9",
        "Евр 10,32-39;Пс 37,3-6.23-24.39-40;Мк 4,26-34",
        "Евр 11,1-2.8-19;Мк 4,35-41",
        "Соф 2,3.3,12-13;Пс 146,6-10;1 Кор 1,26-31;Мф 5,1-12",
        "Евр 11,32-40;Пс 31,20-24;Мк 5,1-20",
        "Евр 12,1-4;Пс 22,26-28.30-32;Мк 5,21-43",
        
        "Евр 12,4-7.11-15;Пс 103,1-2.13-14.17-18;Мк 6,1-6", // 1 февраля
        "Мал 3,1-4;Пс 24,7-10;Лк 2,22-40",
        "Евр 13,1-8;Пс 27,1.3.5.8-9;Мк 6,14-29",
        "Евр 13,15-17.20-21;Пс 23,1-6;Мк 6,30-34",
        "Ис 58,7-10;Пс 112,4-9;1 Кор 2,1-5;Мф 5,13-16",
        "Быт 1,1-19;Пс 104,1-2.5-6.10.12.24.35;Мк 6,53-56",
        "Быт 1,20-2,4;Пс 8,4-9;Мк 7,1-13",
        "Быт 2,4-9.15-17;Пс 104,1-2.27-30;Мк 7,14-23",
        "Быт 2,18-25;Пс 128,1-5;Мк 7,24-30",
        "Быт 3,1-8;Пс 32,1-2,5-7;Мк 7,31-37",
        
        "Быт 3,9-24;Пс 90,3-6.12-13;Мк 8,1-10", // 11 февраля
        "Пс 119,1-2.4-5.17-18.33-34;1 Кор 2,6-10;Мф 5,17-37", // Сир 15,16-21;
        "Быт 4,1-15.25;Пс 50,1.8.16-17.20-21;Мк 8,11-13",
        "Деян 13,46-49;Пс 117,1.2;Лк 10,1-9",
        "Быт 8,6-13.20-22;Пс 116,12-15.18-19;Мк 8,22-26",
        "Быт 9,1-13;Пс 102,16-18.19-21.29.22-23;Мк 8,27-33",
        "Быт 11,1-9;Пс 33,10-15;Мк 8,34-9,1",
        "Евр 11,1-7;Пс 145,2-5.10-11;Мк 9,2-13",
        "Лев 19,1-2.17-18;Пс 103,1-4.8.10.12-13;1 Кор 3,16-23;Мф 5,38-48",
        "Пс 93,1-2.5;Мк 9,14-29", // Сир 1,1-10;

        "Пс 37,3-4.18-19.27-28.39-40;Мк 9,30-37", // 21 февраля // Сир 2,1-13;
        "1 Петр 5,1-4;Пс 23,1-6;Мф 16,13-19",
        "Пс 1,1-4.6;Мк 9,41-50", // Сир 5,1-10;
        "Пс 119,12.16.18.27.34-35; Мк 10, 1-12", // Сир 6,5-17
        "Пс 103,13-18;Мк 10,13-16", // Сир 17,1-13
        "Ис 49,14-15;Пс 62,2-3.6-9;1 Кор 4,1-5;Мф 6,24-34",
        "Пс 32,1-2.5-7;Мк 10,17-27", // Сир 17,20-28;
        "Пс 50,5-8.14.23;Мк 10,28-31", // Сир 35,1-15;

        "", // 1 марта
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        
        "", // 10 марта
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        
        "", // 20 марта
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
]
}
