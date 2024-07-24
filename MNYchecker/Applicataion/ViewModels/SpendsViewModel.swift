//
//  SpendsViewModel.swift
//  MNYchecker
//
//  Created by Савелий Коцур on 29.03.2024.
//

import Foundation
import CoreData

class SpendsViewModel: ObservableObject {
    
    private let context = PersistenceController.shared.container.viewContext
    
    @Published var spends: [SpendModel] = []
    @Published var categories: [CategoryModel] = []
    
    init() {
        loadData()
        loadCategories()
    }
    
    func loadData() {
        let fetchRequest: NSFetchRequest<SpendEntity> = SpendEntity.fetchRequest()
        do {
            let results = try context.fetch(fetchRequest)
            self.spends = results.map { entity in
                return SpendModel(id: entity.id ?? UUID(),
                                  title: entity.title ?? "",
                                  value: entity.value,
                                  category: CategoryModel(id: entity.category?.id ?? UUID(),
                                                          name: entity.category?.name ?? "",
                                                          color: entity.category?.color ?? "",
                                                          icon: entity.category?.icon ?? ""),
                                  date: entity.date ?? Date(),
                                  description: entity.descriptionn ?? "")
            }
        } catch {
            print("Error fetching data: \(error)")
        }
        self.spends.sort { $0.date > $1.date }
    }
    
    func loadCategories() {
        let fetchRequest: NSFetchRequest<CategoryEntity> = CategoryEntity.fetchRequest()
        do {
            let results = try context.fetch(fetchRequest)
            self.categories = results.map { entity in
                return CategoryModel(id: entity.id ?? UUID(),
                                     name: entity.name ?? "",
                                     color: entity.color ?? "",
                                     icon: entity.icon ?? "")
            }
        } catch {
            print("Error fetching data: \(error)")
        }
    }
    
    func insertSpend(_ newSpend: SpendModel) {
        let spendEntity = SpendEntity(context: context)
        spendEntity.id = UUID()
        spendEntity.title = newSpend.title
        spendEntity.value = newSpend.value
        spendEntity.date = newSpend.date
        spendEntity.descriptionn = newSpend.description
        
        let categoryFetchRequest: NSFetchRequest<CategoryEntity> = CategoryEntity.fetchRequest()
        categoryFetchRequest.predicate = NSPredicate(format: "name == %@", newSpend.category.name)
        
        do {
            let existingCategories = try context.fetch(categoryFetchRequest)
            let existingCategory = existingCategories.first
            spendEntity.category = existingCategory
            
            try context.save()
            loadData()
        } catch {
            print("Error saving spend: \(error)")
        }
    }
    
    func insertCategory(_ newCategory: CategoryModel) {
        let categoryEntity = CategoryEntity(context: context)
        categoryEntity.id = UUID()
        categoryEntity.name = newCategory.name
        categoryEntity.icon = newCategory.icon
        categoryEntity.color = newCategory.color
        
        do {
            try context.save()
            print(newCategory)
            loadCategories()
        } catch {
            print("Error saving category: \(error)")
        }
    }
    
    func deleteSpend(_ spendToDelete: SpendModel) {
        let fetchRequest: NSFetchRequest<SpendEntity> = SpendEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "date == %@", spendToDelete.date as NSDate)
        
        do {
            let results = try context.fetch(fetchRequest)
            if let entityToDelete = results.first {
                context.delete(entityToDelete)
                try context.save()
                print("Spend deleted successfully.")
                loadData()
            }
        } catch {
            print("Error deleting spend: \(error)")
        }
    }
    
    var spendCategoriesValues: [(category: String, value: Double, color: String)] {
        let spendCategories = Dictionary(grouping: spends, by: { $0.category.name }).mapValues { $0.reduce(0, { $0 + $1.value }) }
        
        return spendCategories.sorted { $0.value > $1.value }.compactMap { (key, value) -> (category: String, value: Double, color: String)? in
            guard let category = spends.first(where: { $0.category.name == key })?.category else {
                return nil
            }
            let color = category.color
            return (category: key, value: value, color: color)
        }
    }
}
