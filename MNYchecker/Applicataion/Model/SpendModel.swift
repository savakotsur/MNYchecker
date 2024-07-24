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
    var category: CategoryModel // Категория траты
    var date: Date // Дата траты
    var description: String // Описание траты 

    init(id: UUID = UUID(),
         title: String,
         value: Double,
         category: CategoryModel,
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

struct CategoryModel: Identifiable {
    var id: UUID
    var name: String
    var color: String
    var icon: String
    
    init(id: UUID = UUID(),
         name: String,
         color: String,
         icon: String) {
        self.id = id
        self.name = name
        self.color = color
        self.icon = icon
    }
}
