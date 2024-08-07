//
//  SpendDesign.swift
//  MNYchecker
//
//  Created by Савелий Коцур on 04.04.2024.
//

import SwiftUI

struct SpendDesign: View {
    
    @State var title: String
    @State var value: Double
    @State var category: CategoryModel
    @State var date: Date
    
    var body: some View {
        HStack (alignment: .center) {
            Image(systemName: category.icon)
                .foregroundColor(Color(category.color))
                .imageScale(.large)
                .shadow(radius: 3)
            VStack (alignment: .leading) {
                Text(title)
                    .fontWeight(.bold)
                Text(date.formatted(date: .abbreviated, time: .omitted))
            }
            Spacer()
            Text(String(value) + "$")
                .padding(.horizontal, 20)
        }
        .padding(15)
        .background(Color("ElementsColor"))
        .cornerRadius(20)
    }
}
