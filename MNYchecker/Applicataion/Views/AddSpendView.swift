//
//  AddSpendView.swift
//  MNYchecker
//
//  Created by Савелий Коцур on 28.03.2024.
//

import SwiftUI

struct AddSpendView: View {
    
    @ObservedObject var spendsVM: SpendsViewModel
    @Environment(\.dismiss) var dismiss
    @State private var spendTitle = ""
    @State private var spendValue = ""
    @State private var spendDate = Date.now
    @State private var spendCategory = ""
    @State private var spendDescription = ""
    
    var body: some View {
        VStack (alignment: .leading){
            Group {
                TextFieldDesign(textName: "Наименование", textFieldBinding: $spendTitle)
                    .padding(.top, 20)
                VStack (alignment: .leading) {
                    Text("Стоимость")
                        .padding(.horizontal, 35)
                    TextField("", text: $spendValue)
                        .padding(.horizontal, 15)
                        .padding(.vertical, 10)
                        .background(Color("ElementsColor"))
                        .cornerRadius(15)
                        .padding(.horizontal, 30)
                        .keyboardType(.decimalPad)
                }
                Text("Дата")
                    .padding(.horizontal, 35)
                DatePicker("2", selection: $spendDate)
                    .labelsHidden()
                    .padding(.horizontal, 30)
                Text("Категория")
                    .padding(.horizontal, 35)
                Picker("Категория", selection: $spendCategory) {
                    ForEach(spendsVM.categories) { category in
                        Text(category.name).tag(category.name)
                    }
                }
                .pickerStyle(.inline)
                .padding(.horizontal, 15)
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
            }
            Group {
                HStack {
                    Spacer()
                    Button(action: {
                        
                        var category = spendsVM.categories.first(where: { $0.name == spendCategory })
                        if category == nil {
                            category = spendsVM.categories.first
                        }
                        let spend = SpendModel(title: spendTitle, value: Double(spendValue)!, category: category!, date: spendDate, description: spendDescription)
                        spendsVM.insertSpend(spend)
                        dismiss()
                    })
                    {
                        Label {
                            Text("Add")
                        } icon: {
                            Image(systemName: "plus")
                                .imageScale(.large)
                        }
                        .labelStyle(.iconOnly)
                    }
                    .frame(width: screenSize.width / 6.0, height: screenSize.height / 24.0)
                    .background(Color("ElementsColor"))
                    .cornerRadius(100)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 20)
                }
            }
            Spacer()
        }
        .padding(.vertical, 20)
    }
}
