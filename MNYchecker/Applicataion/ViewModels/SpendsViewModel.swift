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
            let spends = try JSONDecoder().decode([SpendModel].self, from: data)
            DispatchQueue.main.async {
                self.spends = spends
            }
        }
        catch {
            print("Error occured 1: \(error)")
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
