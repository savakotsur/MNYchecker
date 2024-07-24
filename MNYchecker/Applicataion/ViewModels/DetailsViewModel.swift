//
//  DetailsViewModel.swift
//  MNYchecker
//
//  Created by Савелий Коцур on 24.07.2024.
//

import Foundation

class DetailsViewModel: ObservableObject {
    @Published var spendCategoriesValuesForSelectedMonth: [(category: String, value: Double, color: String)] = []
    
    func updateSpendCategoriesValues(selectedMonth: Int, selectedYear: Int, spends: [SpendModel]) {
        let calendar = Calendar.current
        
        let spendsForSelectedMonth = spends.filter { spend in
            let spendMonth = calendar.component(.month, from: spend.date)
            let spendYear = calendar.component(.year, from: spend.date)
            return spendMonth == selectedMonth && spendYear == selectedYear
        }
        
        let spendCategories = Dictionary(grouping: spendsForSelectedMonth, by: { $0.category.name }).mapValues { $0.reduce(0, { $0 + $1.value }) }
        
        spendCategoriesValuesForSelectedMonth = spendCategories.sorted { $0.value > $1.value }.compactMap
        { (key, value) -> (category: String, value: Double, color: String)? in
            guard let category = spendsForSelectedMonth.first(where: { $0.category.name == key })?.category else {
                return nil
            }
            let color = category.color
            return (category: key, value: value, color: color)
        }
    }
    
    func formattedMonthName(month: Int) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "LLLL"
        let dateComponents = DateComponents(month: month)
        guard let date = Calendar.current.date(from: dateComponents) else {
            return ""
        }
        let monthName = dateFormatter.string(from: date)
        return monthName.capitalized
    }
}

