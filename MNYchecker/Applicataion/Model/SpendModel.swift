//
//  SpendModel.swift
//  MNYchecker
//
//  Created by Савелий Коцур on 12.04.2024.
//

import Foundation

// Определение модели данных SpendModel
struct SpendModel: Identifiable {
    var id: UUID // Уникальный идентификатор объекта
    var title: String // Название траты
    var value: Double // Сумма траты
    var category: String // Категория траты
    var date: Date // Дата траты
    var description: String // Описание траты 

    init(id: UUID = UUID(),
         title: String,
         value: Double,
         category: String,
         date: Date,
         description: String = "") {
        self.id = id
        self.title = title
        self.value = value
        self.category = category
        self.date = date
        self.description = description
    }
}
