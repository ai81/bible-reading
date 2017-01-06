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
            day >= refs2107.count ? nil : refs2107[day - 1]
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

        "Иоил 2,12-18;Пс 51,3-6.12-14.17;2 Кор 5,20-6,2;Мф 6,1-6.16-18", // 1 марта
        "Втор 30,15-20;Пс 1,1-4.6;Лк 9,22-25",
        "Ис 58,1-9;Пс 51,3-6.18-19;Мф 9,14-15",
        "Ис 58,9-14;Пс 86,1-6;Лк 5,27-32",
        "Быт 2,7-9.3,1-7;Пс 51,3-6.12-14.17;Рим 5,12-19;Мф 4,1-11",
        "Лев 19,1-2.11-18;Пс 19,8-10.15;Мф 25,31-46",
        "Ис 55,10-11;Пс 34,4-7.16-19;Мф 6,7-15",
        "Ион 3,1-10;Пс 51,3-4.12-13.18-19;Лк 11,29-32",
        "Есф 4,1.3-5.12-14;Пс 138,1-3.7-8;Мф 7,7-12",
        "Иез 18,21-28;Пс 130,1-8;Мф 5,20-26",
        
        "Втор 26,16-19;Пс 119,1-2.4-5.7-8;Мф 5,43-48", // 11 марта
        "Быт 12,1-4;Пс 33,4-5.18-20.22;2 Тим 1,8-10;Мф 17,1-9",
        "Дан 9,4-10;Пс 79,8.9.11.13;Лк 6,36-38",
        "Ис 1,10.16-20;Пс 50,8-9.16-17.21.23;Мф 23,1-12",
        "Иер 18,18-20;Пс 31,5-6.14-16;Мф 20,17-28",
        "Иер 17,5-10;Пс 1,1-4.6;Лк 16,19-31",
        "Быт 37,3-4.12-13.17-28;Пс 105,16-21;Мф 21,33-43.45-46",
        "Мих 7,14-15.18-20;Пс 103,1-4.9-12;Лк 15,1-3.11-32",
        "Исх 17,3-7;Пс 95,1-2.6-9;Рим 5,1-2.5-8;Ин 4,5-42",
        "2 Цар 7, 4-5.12-14.16;Пс 89,2-5.27.29;Рим 4,13.16-18.22;Мф 1,16.18-21.24",
        
        "Дан 3,25.34-43;Пс 25,4-9;Мф 18,21-35", // 21 марта
        "Втор 4,1.5-9;Пс 147,12-13.15-16.19-20;Мф 5,17-19",
        "Иер 7,23-28;Пс 95,1-2.6-9;Лк 11,14-23",
        "Ос 14,2-10;Пс 81,6-11.14.17;Мк 12,28-34",
        "Ис 7,10-14.8,10;Пс 40,7-11;Евр 10,4-10;Лк 1,26-38",
        "1 Цар 16,1.6-7.10-13;Пс 23,1-6;Еф 5,8-14;Ин 9,1-41",
        "Ис 65,17-21;Пс 30,2.4-6.11-13;Ин 4,43-54",
        "Иез 47,1-9.12;Пс 46,2-3.5-6.8-9;Ин 5,1-16",
        "Ис 49,8-15;Пс 145,8-9.13-14.17-18;Ин 5,17-30",
        "Исх 32,7-14;Пс 106,19-23;Ин 5,31-47",
        "Пс 34,17-21.23;Ин 7,1-2.10.25-30", // Прем 2,1.12-22;

        "Иер 11,18-20;Пс 7,2-3.9-12;Ин 7,40-53", // 1 апреля
        "Иез 37,12-14;Пс 130,1-8;Рим 8,8-11;Ин 11,1-45",
        "Дан 13,1-9.15-17.19-30.33-62;Пс 23,1-6;Ин 8,1-11",
        "Числ 21,4-9;Пс 102,2-3.16-21;Ин 8,21-30",
        "Дан 3,14-20.91-92.95;Дан 3,52-53.55-56;Ин 8,31-42",
        "Быт 17,3-9;Пс 105,4-9;Ин 8,51-59",
        "Иер 20,10-13;Пс 18,2-7;Ин 10,31-42",
        "Иез 37,21-28;Иер 31,10.11-13;Ин 11,45-56",
        "Ис 50,4-7;Пс 22,8-9.17-20.23-24;Флп 2,6-11;Мф 26,14-27.66",
        "Ис 42,1-7;Пс 27,1-3.13-14;Ин 12,1-11",

        "Ис 49,1-6;Пс 71,1-6.15.17;Ин 13,21-33.36-38", // 11 апреля
        "Ис 50,4-9;Пс 69,8-10.21-22.31.33-34;Мф 26,14-25",
        "Исх 12,1-8.11-14;Пс 116,12-13.15-18;1 Кор 11,23-26;Ин 13,1-15",
        "Ис 52,13-53,12;Пс 31,2.6.12-13.15-17.25;Евр 4,14-16.5,7-9;Ин 18,1-19,42",
        "Быт 1,1-2,2;Быт 22,1-18;Исх 14,15-15,1;Ис 54,5-14;Ис 55,1-11;Иез 36,16-28;Рим 6,3-11;Пс 118,1-29;Мф 28,1-10", // Вар 3,9-15.32-4,4;
        "Деян 10,34.37-43;Пс 118,1-2.16-17.22-23;Кол 3,1-4;Ин 20,1-9",
        "Деян 2,14.22-23;Пс 16,1-2.5.7-11;Мф 28,8-15",
        "Деян 2,36-41;Пс 33,4-5.18-20.22;Ин 20,11-18",
        "Деян 3,1-10;Пс 105,1-4.6-9;Лк 24,13-35",
        "Деян 3,11-26;Пс 8,2.5-9;Лк 24,35-48",

        "Деян 4,1-12;Пс 118,1-2.4.22-27;Ин 21,1-14", // 21 апреля
        "Деян 4,13-21;Пс 118,1.14-16.18-21;Мк 16,9-15",
        "Деян 2,42-47;Пс 118,2-4.13-15.22-24;1 Петр 1,3-9;Ин 20,19-31",
        "Деян 4,23-31;Пс 2,1-9;Ин 3,1-8",
        "1 Петр 5,5-14;Пс 89,2-3.6-7.16-17;Мк 16,15-20",
        "Деян 5,17-26;Пс 34,2-9;Ин 3,16-21",
        "Деян 5,27-33;Пс 34,2.9.17-20;Ин 3,31-36",
        "Деян 5,34-42;Пс 27,1.4.13-14;Ин 6,1-15",
        "Деян 6,1-7;Пс 33,1-2.4-5.18-19;Ин 6,16-21",
        "Деян 2,14.22-33;Пс 16,1-2.5.7-11;1 Петр 1,17-21;Лк 24,13-35",
        
        "Деян 6,8-15;Пс 119,23-24.26-27.29-30;Ин 6,22-29", // 1 мая
        "Деян 7,51-8,1;Пс 31,3-4.6-8.17.21;Ин 6,30-35",
        "1 Кор 15,1-8;Пс 19,2-5;Ин 14,6-14",
        "Деян 8,26-40;Пс 66,8-9.16-17.20;Ин 6,44-51",
        "Деян 9,1-20;Пс 117,1-2;Ин 6,52-59",
        "Деян 9,31-42;Пс 116,12-17;Ин 6,60-69",
        "Деян 2,14.36-41;Пс 23,1-6;1 Петр 2,20-25;Ин 10,1-10",
        "Деян 11,1-18;Пс 42,2-3.43,3-4;Ин 10,11-18",
        "Деян 11,19-26;Пс 87,1-7;Ин 10,22-30",
        "Деян 12,24-13,5;Пс 67,2-6.8;Ин 12,44-50",

        "Деян 13,13-25;Пс 89,2-3.21-22.25.27;Ин 13,16-20", // 11 мая
        "Деян 13,26-33;Пс 2,6-11;Ин 14,1-6",
        "Деян 13,44-52;Пс 98,1-4;Ин 14,7-14",
        "Деян 6,1-7;Пс 33,1-2.4-5.18-19;1 Петр 2,4-9;Ин 14,1-2",
        "Деян 14,5-18;Пс 115,1-4.15-16;Ин 14,21-26",
        "Деян 14,19-28;Пс 145,10-13.21;Ин 14,27-31",
        "Деян 15,1-6;Пс 122,1-5;Ин 15,1-8",
        "Деян 15,7-21;Пс 96,1-3.10;Ин 15,9-11",
        "Деян 15,22-31;Пс 57,8-12;Ин 15,12-17",
        "Деян 16,1-10;Пс 100,2-3.5;Ин 15,18-21",

        "Деян 8,5-8.14-17;Пс 66,1-7.16.20;1 Петр 3,15-18;Ин 14,15-21", // 21 мая
        "Деян 16,11-15;Пс 150,1-6;Ин 15,26-16,4", // у псалма: .9
        "Деян 16,22-34;Пс 138,1-3.7-8;Ин 16,5-11",
        "Деян 17,15.22-18,1;Пс 148,1-2.11-14;Ин 16,12-15",
        "Деян 1,1-11;Пс 47,2-3.6-9;Еф 1,17-23;Мф 28,16-20",
        "Деян 18,9-18;Пс 47,2-7;Ин 16,20-23",
        "Деян 18,23-28;Пс 47,2-3.8-10;Ин 16,23-28",
        "Деян 1,12-14;Пс 27,1.4.7-8;1 Петр 4,13-16;Ин 17,1-11",
        "Деян 19,1-8;Пс 68,2-7;Ин 16,29-33",
        "Деян 20,17-27;Пс 68,10-11.20-21;Ин 17,1-11",
        "Соф 3,14-18;Ис 12,2-6;Лк 1,39-56",
        
        "Деян 22,30.23,6-11;Пс 16,1-2.5.7-11;Ин 17,20-26", // 1 июня
        "Деян 25,13-21;Пс 103,1-2.11-12.19-20;Ин 21,15-19",
        "Деян 28,16-20.30-31;Пс 11,4.5.7;Ин 21,20-25",
        "Деян 2,1-11;Пс 104,1.24.29-31.34;1 Кор 12,3-7.12-13;Ин 20,19-23",
        "Пс 112,1-6;Мк 12,1-12", // Тов 1,3.2,1-8;
        "Пс 112,1-2.7-9;Мк 12,13-17", // Тов 2,9-14;
        "Пс 25,2-9;Мк 12,18-27", // Тов 3,1-11;
        "Пс 128,1-5;Мк 12,28-34", // Тов 6,10-11.7,1.9-17.8,4-10;
        "Пс 146,1-2.6-10;Мк 12,35-37", // Тов 11,5-17;
        "Мк 12,37-44", // Тов 12,1.5-15.20;Тов 13,2.6;

        "Исх 34,4-6.8-9;Дан 3,52.53.55.54.56;2 Кор 13,11-13;Ин 3,16-18", // 11 июня
        "2 Кор 1,1-7;Пс 34,2-9;Мф 5,1-12",
        "2 Кор 1,18-22;Пс 119,129-133.135;Мф 5,13-16",
        "2 Кор 3,4-11;Пс 99,5-9;Мф 5,17-19",
        "2 Кор 3,15-4,1.3-6;Пс 85,9-14;Мф 5,20-26",
        "2 Кор 4,7-15;Пс 116,10-11.15-18;Мф 5,27-32",
        "2 Кор 5,14-21;Пс 103,1-4.8-9.11-12;Мф 5,33-37",
        "Втор 8,2-3.14-16;Пс 147,12-15.19-20;1 Кор 10,16-17;Ин 6,51-58",
        "2 Кор 6,1-10;Пс 98,1-4;Мф 5,38-42",
        "2 Кор 8,1-9;Пс 146,1-2.5-9;Мф 5,43-48",
        
        "2 Кор 9,6-11;Пс 112,1-4.9;Мф 6,1-6.16-18", // 21 июня
        "2 Кор 11,1-11;Пс 111,1-4.7-8;Мф 6,7-15",
        "Втор 7,6-11;Пс 103,1-4.6-8.10;1 Ин 4,7-16;Мф 11,25-30",
        "Ис 49,1-6;Пс 139,1-3.13-14.15;Деян 13,22-26;Лк 1,57-66.80",
        "Иер 20,10-13;Пс 69,8-10.14.17.33-35;Рим 5,12-15;Мф 10,26-33",
        "Быт 12,1-9;Пс 33,12-13.18-20.22;Мф 7,1-5",
        "Быт 13,2.5-18;Пс 15,2-5;Мф 7,6.12-14",
        "Деян 12,1-11;Пс 34,2-9;2 Тим 4,6-8.17-18;Мф 16,13-19",
        "Деян 12,1-11;Пс 34,2-9;2 Тим 4,4-8.17-18;Мф 16,13-19", // ошибка в календаре?
        "Быт 17,1.9-10.15-22;Пс 128,1-5;Мф 8,1-4",
        
        "Быт 18,1-14;Лк 1,46-50.53-55;Мф 8,5-17", // 1 июля
        "4 Цар 4,8-11.14-16;Пс 89,2-3.16-19;Рим 6,3-4.8-11;Мф 10,37-42",
        "Еф 2,19-22;Пс 117,1-2;Ин 20,24-29",
        "Быт 19,15-29;Пс 26,2-3.9-12;Мф 8,23-27",
        "Быт 21,5.8-20;Пс 34,7-8.10-13;Мф 8,28-34",
        "Быт 22,1-19;Пс 116,1-6.8-9;Мф 9,1-8",
        "Быт 23,1-4.19.24,1-8.62-67;Пс 106,1-5;Мф 9,9-13",
        "Быт 27,1-5.15-29;Пс 135,1-6;Мф 9,14-17",
        "Зах 9,9-10;Пс 145,1-2.8-11.13-14;Рим 8,9.11-13;Мф 11,25-30",
        "Быт 28,10-22;Пс 91,1-4.14-15;Мф 9,18-26",

        "Притч 2,1-9;Пс 34,2-11;Мф 19,27-29", // 11 июля
        "Быт 41,55-57.42,5-7.17-24;Пс 33,2-3.10-11.18-19;Мф 10,1-7",
        "Быт 44,18-21.24-29.45,1-5;Пс 105,16-21;Мф 10,7-15",
        "Быт 46,1-7.28-30;Пс 37,3-4.18-19.27-28.39-40;Мф 10,16-23",
        "Быт 49,29-33.50,15-26;Пс 105,1-4.6-7;Мф 10,24-33",
        "Ис 55,10-11;Пс 65,10-14;Рим 8,18-23;Мф 13,1-23",
        "Исх 1,8-14.22;Пс 124,1-8;Мф 10,34-11,1",
        "Исх 2,1-15;Пс 69,3.14.30-31.33-34;Мф 11,20-24",
        "Исх 3,1-6.9-12;Пс 103,1-4.6-7;Мф 11,25-27",
        "Исх 3,13-20;Пс 105,1.5.8-9.24-27;Мф 11,28-30",

        "Исх 11,10-12,14;Пс 116,12-13.15.16;Мф 12,1-8", // 21 июля
        "Песн 3,1-4;Пс 63,2-6.8-9;Ин 20,1-2.11-18",
        "Пс 86,5-6.9-10.15-16;Рим 8,26-27;Мф 13,24-43", //Прем 12,13.16-19;
        "Исх 14,5-18;Исх 15,1-6;Мф 12,38-42",
        "2 Кор 4,7-15;Пс 126,1-6;Мф 20,20-28",
        "Исх 16,1-5.9-15;Пс 78,18-19.23-28;Мф 13,1-9",
        "Исх 19,1-2.9-11.16-20;Дан 3,52-56;Мф 13,10-17",
        "Исх 20,1-17;Пс 19,8-11;Мф 13,18-23",
        "1 Ин 4,7-16;Пс 34,2-11;Ин 11,19-27",
        "3 Цар 3,5.7-12;Пс 119,57.72.76-77.127-130;Рим 8,28-30;Мф 13,44-52",
        "Исх 32,15-24.30-34;Пс 106,19-23;Мф 13,31-35",
        
        "Исх 33,7-11.34,5-9.28;Пс 103,6-13;Мф 13,36-43", // 1 августа
        "Исх 34,29-35;Пс 99,5-7.9;Мф 13,44-46",
        "Исх 40,16-21.34-38;Пс 84,1-6;Мф 13,47-53",
        "Лев 23,1.4-11.15-16.27.34-37;Пс 81,3-6.10-11;Мф 13,54-58",
        "Лев 25,1.8-17;Пс 67,2-3.5.8;Мф 14,1-12",
        "Дан 7,9-10.13-14;Пс 97,1-2.5-6.9;2 Петр 1,16-19;Мф 17,1-9",
        "Числ 11,4-15;Пс 81,12-17;Мф 14,22-36",
        "Числ 12,1-13;Пс 51,3-6.12-13;Мф 15,1-2.10-14",
        "Числ 13,2-3.26-14,1.26-30.34-35;Пс 106,6-7.13-14.21-23;Мф 15,21-28",
        "2 Кор 9,6-10;Пс 112,1-2.5-9;Ин 12,24-26",

        "Втор 4,32-40;Пс 77,12-16.21;Мф 16,24-28", // 11 августа
        "Втор 6,4-13;Пс 18,2-4.47.51;Мф 17,14-20",
        "3 Цар 19,9.11-13;Пс 85,9-14;Рим 9,1-5;Мф 14,22-33",
        "Втор 10,12-22;Пс 147,12-15.19-20;Мф 17,22-27",
        "Откр 11,19.12,1-6.10;Пс 45,10-12.16;1 Кор 15,20-27;Лк 1,39-56",
        "Втор 34,1-12;Пс 66,1-3.5.8.16-17;Мф 18,15-20",
        "Ис Нав 3,7-11.13-17;Пс 114,1-6;Мф 18,21-19,1",
        "Ис Нав 24,1-13;Пс 136,1-3.16-18.21-22;Мф 19,3-12",
        "Ис Нав 24,14-29;Пс 16,1-2.5.7-8.11;Мф 19,13-15",
        "Ис 56,1.6-7;Пс 67,2-3.5.6.8;Рим 11,13-15.29-32;Мф 15,21-28",

        "Суд 2,11-19;Пс 106,34-37.39-40.43-44;Мф 19,16-22", // 21 августа
        "Суд 6,11-24;Пс 84,9.11-13;Мф 19,23-30", // -14
        "Суд 9,6-15;Пс 21,2-7;Мф 20,1-16",
        "Откр 21,9-14;Пс 145,10-13.17-18;Ин 1,45-51",
        "Руф 1,1.3-6.14-16.22;Пс 146,5-10;Мф 22,34-40",
        "Руф 2,1-3.8-11.4,13-17;Пс 128,1-5;Мф 23,1-12",
        "Исх 22,19-23;Пс 138,1-3.6.8;Рим 11,33-36;Мф 16,13-20",
        "1 Фес 1,1-5.8-10;Пс 149,1-6.9;Мф 23,13-22",
        "Иер 1,17-19;Пс 71,1-6.15.17;Мк 6,17-29",
        "1 Фес 2,9-13;Пс 139,7-12;Мф 23,27-32",
        "1 Фес 3,7-13;Пс 90,4-5.12-14.17;Мф 24,42-51",
        
        "1 Фес 4,1-8;Пс 97,1-2.5-6.10-12;Мф 25,1-3", // 1 сентября
        "1 Фес 4,9-11;Пс 98,1.7-9;Мф 25,14-30",
        "Иер 20,7-9;Пс 63,2-6.8-9;Рим 12,1-2;Мф 16,21-27",
        "1 Фес 4,13-18;Пс 96,1.3-5.11-13;Лк 4,16-30",
        "1 Фес 5,1-6.9-11;Пс 27,1.4.13-14;Лк 4,31-37",
        "Кол 1,1-8;Пс 52,10-11;Лк 4,38-44",
        "Кол 1,9-14;Пс 98,2-6;Лк 5,1-11",
        "Мих 5,1-4;Пс 13,6;Мф 1,1-16.18-23",
        "Кол 1,21-23;Пс 54,3-4.6.8;Лк 6,1-5",
        "Иез 33,7-9;Пс 95,1-2.6-9;Рим 13,8-10;Мф 18,15-20",

        "Кол 1,24-2,3;Пс 62,6-7.9;Лк 6,6-11", // 11 сентября
        "Кол 2,6-18;Пс 145,1-2.8-9.10-11;Лк 6,12-19",
        "Кол 3,1-11;Пс 145,2-3.10-13;Лк 6,20-26",
        "Числ 21,4-9;Пс 78,1-2.34-38;Флп 2,6-11;Ин 3,13-17",
        "Евр 5,7-9;Пс 31,2-6.15-16.20;Ин 19,25-27",
        "1 Тим 1,15-17;Пс 113,1-7;Лк 6,43-49",
        "Пс 103,1-4.9-12;Рим 14,7-9;Мф 18,21-35", // Сир 27,33-28,9;
        "1 Тим 2,1-8;Пс 28,2.7-9;Лк 7,1-10",
        "1 Тим 3,1-13;Пс 101,1-3.5-6;Лк 7,11-17",
        "1 Тим 3,14-16;Пс 111,1-6;Лк 7,31-35",

        "Еф 4,1-7.11-13;Пс 19,2-5;Мф 9,9-13", // 21 сентября
        "1 Тим 6,2-12;Пс 49,6-10.17-20;Лк 8,1-3",
        "1 Тим 6,13-16;Пс 100,1-5;Лк 8,4-15",
        "Ис 55,6-9;Пс 145,2-3.8-9.17-18;Флп 1,20-24.27;Мф 20,1-16",
        "Езд 1,1-6;Пс 126,1-6;Лк 8,16-18",
        "Езд 6,7-8.12.14-20;Пс 122,1-2.4-5;Лк 8,19-21",
        "Езд 9,5-9;Лк 9,1-6", // Тов 13,2-5.8;
        "Агг 1,1-8;Пс 149,1-6.9;Лк 9,7-9",
        "Дан 7,9-10.13-14;Пс 138,1-5;Ин 1,47-51",
        "Зах 2,5-9.14-15;Иер 31,10.11-13;Лк 9,43-45",

        "Иез 18,25-28;Пс 25,4-9;Флп 2,1-11; Мф 21,28-32", // 1 октября
        "Исх 23,20-23;Пс 91, 1-6.10-11;Мф 18,1-5.10",
        "Зах 8,20-23;Пс 87,1-7;Лк 9,51-56",
        "Неем 2,1-8;Пс 137,1-6;Лк 9,57-62",
        "Неем 8,1-12;Пс 19,7-11;Лк 10,1-12",
        "Пс 79,1-5.8-9;Лк 10,13-16", // Вар 1,15-22;
        "Пс 69,33-37;Лк 10,17-24", // Вар 4,5-12.27-29;
        "Ис 5,1-7;Пс 80,9.12-16.19-20;Флп 4,6-9;Мф 21,33-43",
        "Ион 1,1-2,1.11;Ион 2,3-5.8;Лк 10,25-37",
        "Ион 3,1-10;Пс 130,1-4.7-8;Лк 10,38-42",

        "Ион 4,1-11;Пс 86,3-6.9-10;Лк 11,1-4", // 11 октября
        "Мал 3,14-4,2;Пс 1,1-4.6;Лк 11,5-13",
        "Иоил 1,13-15.2,1-2;Пс 9,2-3.6.16.8-9;Лк 11,15-26",
        "Иоил 4,12-21;Пс 97,1-2.5-6.11-12;Лк 11,27-28",
        "Ис 25,6-10;Пс 23,1-6;Флп 4,12-14.19-20;Мф 22,1-14",
        "Рим 1,1-7;Пс 98,1-4;Лк 11,29-32",
        "Рим 1,16-25;Пс 19,2-5;Лк 11,37-41",
        "2 Тим 4,10-17;Пс 145,10-13.17-18;Лк 10,1-9",
        "Рим 3,21-30;Пс 130,1-6;Лк 11,47-54",
        "Рим 4,1-8;Пс 32,1-2.5.11;Лк 12,1-7",

        "Рим 4,13.16-18;Пс 105,6-9.42-43;Лк 12,8-12", // 21 октября
        "Ис 45,1.4-6;Пс 96,1.3.4-10;1 Фес 1,1-5;Мф 22,15-21",
        "Рим 4,20-25;Лк 1,69-75;Лк 12,13-21",
        "Рим 5,12.15.17-21;Пс 40,7-10.17;Лк 12,35-38",
        "Рим 6,12-18;Пс 124,1-8;Лк 12,39-48",
        "Рим 6,19-23;Пс 1,1-4.6;Лк 12,49-53",
        "Рим 7,18-25;Пс 119,66.68.76-77.93-94;Лк 12,54-59",
        "Еф 2,19-22;Пс 19,2-5;Лк 6,12-19",
        "Исх 22,20-26;Пс 18,2-4.47.51;1 Фес 1,5-10;Мф 22,34-40",
        "Рим 8,12-17;Пс 68,2.4.6-7.20-21;Лк 13,10-17",
        "Рим 8,18-25;Пс 126,1-6;Лк 13,18-21",
]
}
