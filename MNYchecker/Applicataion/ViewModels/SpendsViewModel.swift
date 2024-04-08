//
//  SpendsViewModel.swift
//  MNYchecker
//
//  Created by Савелий Коцур on 29.03.2024.
//

import Foundation

class SpendsViewModel: ObservableObject {
    
    @Published var spends: [SpendModel] = []
    
    init() {
        getData()
    }
    
    func getData() {
        guard let data = self.getJSONData() else { return }
        do {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let spends = try decoder.decode([SpendModel].self, from: data)
            DispatchQueue.main.async {
                self.spends = spends
            }
        }
        catch {
            print("Error occured 2: \(error)")
        }
    }
    
    func getJSONData() -> Data? {
        guard let fileURL = Bundle.main.url(forResource: "Spends.json", withExtension: nil) else { return nil }
        do {
            let jsonData = try Data(contentsOf: fileURL)
            return jsonData
        } catch {
            print("Error occured 1: \(error)")
        }
        return nil
    }
    
}
