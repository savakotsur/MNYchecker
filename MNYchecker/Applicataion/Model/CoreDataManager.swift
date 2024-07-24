//
//  CoreDataManager.swift
//  MNYchecker
//
//  Created by Савелий Коцур on 09.05.2024.
//

import Foundation
import CoreData

final class PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "SpendsModel")
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
            self.addInitialCategoriesIfNeeded(context: self.container.viewContext)
        }
    }
    
    private func addInitialCategoriesIfNeeded(context: NSManagedObjectContext) {
        let fetchRequest: NSFetchRequest<CategoryEntity> = CategoryEntity.fetchRequest()
        do {
            let count = try context.count(for: fetchRequest)
            if count == 0 {
                let categories = [
                    ("Еда", "blue", "cart.fill"),
                    ("Транспорт", "red", "car.fill"),
                    ("Развлечения", "green", "gamecontroller.fill")
                ]
                
                for (name, color, icon) in categories {
                    let category = CategoryEntity(context: context)
                    category.name = name
                    category.color = color
                    category.icon = icon
                }
                try context.save()
            }
        } catch {
            print("Ошибка добавления начальных категорий: \(error)")
        }
    }
}
