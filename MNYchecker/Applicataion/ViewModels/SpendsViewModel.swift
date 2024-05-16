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
    
    init() {
        loadData()
    }
    
    func loadData() {
        let fetchRequest: NSFetchRequest<SpendEntity> = SpendEntity.fetchRequest()
        do {
            let results = try context.fetch(fetchRequest)
            self.spends = results.map { entity in
                return SpendModel(id: entity.id ?? UUID(),
                                  title: entity.title ?? "",
                                  value: entity.value,
                                  category: entity.category ?? "",
                                  date: entity.date ?? Date(),
                                  description: entity.descriptionn ?? "")
            }
        } catch {
            print("Error fetching data: \(error)")
        }
    }
    
    func insertSpend(_ newSpend: SpendModel) {
        let spendEntity = SpendEntity(context: context)
        spendEntity.value = newSpend.value
        spendEntity.date = newSpend.date
        spendEntity.descriptionn = newSpend.description
        spendEntity.category = newSpend.category
        spendEntity.title = newSpend.title
        
        do {
            try context.save()
            print("Spend saved successfully.")
            loadData()
        } catch {
            print("Error saving spend: \(error)")
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
    
    var spendCategories: [(category: String, value: Double)] {
        let categoryValues = Dictionary(grouping: spends, by: { $0.category }).mapValues { $0.reduce(0, { $0 + $1.value }) }
        return categoryValues.sorted { $0.value > $1.value }.map { ($0.key, $0.value) }
    }
}
