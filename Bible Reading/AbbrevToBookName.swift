//
//  AbbrevToBookIndex.swift
//  Bible Reading
//
//  Created by Anton Ivanov on 03.01.17.
//  Copyright © 2017 Anton Ivanov. All rights reserved.
//

import Foundation

class AbbrevToBookName {
    public static func map(abbrev: String) -> String? {
       return intMap[abbrev]
    }
    
    private static let intMap = ["Быт": "Первая книга Моисеева. Бытие",
                              "Исх": "Вторая книга Моисеева. Исход",
                              "Лев": "Третья книга Моисеева. Левит",
                              "Числ": "Четвертая книга Моисеева. Числа",
                              "Втор": "Пятая книга Моисеева. Второзаконие",
                              "Ис Нав": "Книга Иисуса Навина", "Нав": "Книга Иисуса Навина",
                              "Суд": "Книга Судей Израилевых",
                              "Руф": "Книга Руфь",
                              "1 Цар": "Первая книга Царств",
                              "2 Цар": "Вторая книга Царств",
                              
                              "3 Цар": "Третья книга Царств",
                              "4 Цар": "Четвертая книга Царств",
                              "1 Пар": "Первая книга Паралипоменон",
                              "2 Пар": "Вторая книга Паралипоменон",
                              "Езд": "Книга Ездры", "1 Езд": "Книга Ездры",
                              "Неем": "Книга Неемии", "Нее": "Книга Неемии",
                              "Есф": "Книга Есфирь",
                              "Иов": "Книга Иова",
                              "Пс": "Псалтирь",
                              "Притч": "Книга Притчей Соломоновых",
                              
                              "Екк": "Книга Екклесиаста, или Проповедника", "Еккл": "Книга Екклесиаста, или Проповедника",
                              "Песн": "Книга Песни Песней Соломона",
                              "Ис": "Книга Пророка Исаии",
                              "Иер": "Книга Пророка Иеремии",
                              "Плач": "Книга Плач Иеремии",
                              "Иез": "Книга Пророка Иезекииля",
                              "Дан": "Книга Пророка Даниила",
                              "Ос": "Книга Пророка Осии",
                              "Иоил": "Книга Пророка Иоиля",
                              "Ам": "Книга Пророка Амоса",
                              "Авд": "Книга Пророка Авдия",
                              
                              "Ион": "Книга Пророка Ионы",
                              "Мих": "Книга Пророка Михея",
                              "Наум": "Книга Пророка Наума",
                              "Авв": "Книга Пророка Аввакума",
                              "Соф": "Книга Пророка Софонии",
                              "Агг": "Книга Пророка Аггея",
                              "Зах": "Книга Пророка Захарии",
                              "Мал": "Книга Пророка Малахии",
                              
                              "Мф": "От Матфея святое благовествование",
                              "Мк": "От Марка святое благовествование",
                              "Лк": "От Луки святое благовествование",
                              "Ин": "От Иоанна святое благовествование",
                              
                              "Деян": "Деяния святых Апостолов",
                              "Рим": "Послание к Римлянам",
                              "1 Кор": "Первое послание к Коринфянам",
                              "2 Кор": "Второе послание к Коринфянам",
                              "Гал": "Послание к Галатам",
                              "Еф": "Послание к Ефесянам",
                              "Флп": "Послание к Филиппийцам",
                              "Кол": "Послание к Колоссянам",
                              
                              "1 Фес": "Первое послание к Фессалоникийцам",
                              "2 Фес": "Второе послание к Фессалоникийцам",
                              "1 Тим": "Первое послание к Тимофею",
                              "2 Тим": "Второе послание к Тимофею",
                              "Тит": "Послание к Титу",
                              "Флм": "Послание к Филимону",
                              "Евр": "Послание к Евреям",
                              "Иак": "Послание Иакова",
                              "1 Петр": "Первое послание Петра",
                              "2 Петр": "Второе послание Петра",
                              
                              "1 Пет": "Первое послание Петра",
                              "2 Пет": "Второе послание Петра",

                              "1 Ин": "Первое послание Иоанна",
                              "2 Ин": "Второе послание Иоанна",
                              "3 Ин": "Третье послание Иоанна",
                              "Иуд": "Послание Иуды",
                              "Откр": "Откровение Иоанна Богослова",
                              
                              "Тов": "Книга Товита",
                              "Иф": "Книга Иудифи",
                              "Прем": "Книга премудрости Соломона",
                              "Сир": "Книга премудрости Иисуса, сына Сирахова",
                              "По. Иер": "Послание Иеремии",
                              "Вар": "Книга пророка Варуха",
                              "1 Макк": "Первая книга Маккавейская",
                              "2 Макк": "Вторая книга Маккавейская",
                              "3 Макк": "Третья книга Маккавейская",
                              "2 Езд": "Вторая книга Ездры",
                              "3 Езд": "Третья книга Ездры"
    ]
}
