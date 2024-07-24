//
//  ColorSelectionItem.swift
//  MNYchecker
//
//  Created by Савелий Коцур on 24.07.2024.
//

import SwiftUI

struct ColorSelectionItem: View {
    let color: String
    
    var body: some View {
        Rectangle()
            .frame(minWidth: 60, minHeight: 60)
            .foregroundColor(Color(color))
            .cornerRadius(15)
            .shadow(radius: 5)
    }
}
