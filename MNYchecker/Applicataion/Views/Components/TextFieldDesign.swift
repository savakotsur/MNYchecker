//
//  TextFieldDesign.swift
//  MNYchecker
//
//  Created by Савелий Коцур on 05.05.2024.
//

import SwiftUI

struct TextFieldDesign: View {
    
    @State var textName: String
    @State var textFieldBinding: Binding<String>
    var body: some View {
        VStack (alignment: .leading) {
            Text(textName)
                .padding(.horizontal, 35)
            TextField("", text: textFieldBinding)
                .padding(.horizontal, 15)
                .padding(.vertical, 10)
                .background(Color("ElementsColor"))
                .cornerRadius(15)
                .padding(.horizontal, 30)
        }
    }
}
