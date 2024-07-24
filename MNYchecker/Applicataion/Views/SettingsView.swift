//
//  SettingsView.swift
//  MNYchecker
//
//  Created by Савелий Коцур on 03.04.2024.
//

import SwiftUI

struct SettingsView: View {
    @State var categoryName = ""
    
    var body: some View {
        VStack (alignment: .leading) {
            Group {
                TextFieldDesign(textName: "Наименование категории", textFieldBinding: $categoryName)
                    .padding(.top, 20)
            }
        }
    }
}
