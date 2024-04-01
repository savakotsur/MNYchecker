//
//  Spend.swift
//  MNYchecker
//
//  Created by Савелий Коцур on 29.03.2024.
//

import Foundation

struct SpendModel: Codable, Identifiable {
    var id: String
    var title: String
    var value: Double
    var description: String
    
//    enum CodingKeys: String, CodingKey {
//        case title
//        case value
//        case description
//    }
//    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.title = try container.decode(String.self, forKey: .title)
//        self.value = try container.decode(Double.self, forKey: .value)
//        self.description = try container.decode(String.self, forKey: .description)
//    }
//    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(title, forKey: .title)
//        try container.encode(value, forKey: .value)
//        try container.encode(description, forKey: .description)
//    }
}
