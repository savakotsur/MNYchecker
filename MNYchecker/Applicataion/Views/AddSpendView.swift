//
//  AddSpendView.swift
//  MNYchecker
//
//  Created by Савелий Коцур on 28.03.2024.
//

import SwiftUI

struct AddSpendView: View {
    
    @State private var spendName = ""
    @State private var spendValue = ""
    @State private var spendDate = Date.now
    @State private var spendCategory = ""
    @State private var spendDescription = ""
    
    var body: some View {
        VStack (alignment: .leading){
                TextFieldDesign(textName: "Наименование", textFieldBinding: $spendName)
                TextFieldDesign(textName: "Стоимость", textFieldBinding: $spendValue)
                Text("Дата")
                    .padding(.horizontal, 35)
                DatePicker("2", selection: $spendDate)
                    .labelsHidden()
                    .padding(.horizontal, 30)
                Text("Категория")
                    .padding(.horizontal, 35)
                TextField("", text: $spendCategory)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 10)
                    .background(Color("ElementsColor"))
                    .cornerRadius(15)
                    .padding(.horizontal, 30)
                Text("Описание")
                    .padding(.horizontal, 35)
            TextField("", text: $spendDescription, axis: .vertical)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 10)
                    .background(Color("ElementsColor"))
                    .cornerRadius(15)
                    .padding(.horizontal, 30)
                    .lineLimit(1...6)
            Spacer()
        }
        .padding(.vertical, 20)
    }
}

struct AddSpendView_Previews: PreviewProvider {
    static var previews: some View {
        AddSpendView()
    }
}
