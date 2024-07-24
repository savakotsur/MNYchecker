//
//  SettingsView.swift
//  MNYchecker
//
//  Created by Савелий Коцур on 03.04.2024.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var spendsVM: SpendsViewModel
    @Environment(\.dismiss) var dismiss
    @State var categoryName = ""
    @State var categoryColor = "red"
    @State var categoryIcon = "house.fill"
    let rows = [GridItem(.fixed(60)), GridItem(.fixed(60))]
    let images = ["house.fill", "cart.fill", "creditcard.fill", "fork.knife", "car.fill", "stethoscope", "gamecontroller.fill", "book.fill", "wrench.fill", "gift.fill"]
    
    var body: some View {
        VStack (alignment: .center) {
            TextFieldDesign(textName: "Наименование категории", textFieldBinding: $categoryName)
                .padding(.top, 20)
                .padding(.bottom, 15)
            VStack (alignment: .leading) {
                HStack {
                    Text("Выберите цвет")
                    Circle()
                        .frame(maxWidth: 15, maxHeight: 15)
                        .foregroundColor(Color(categoryColor))
                        .shadow(radius: 5)
                }
                LazyHGrid(rows: rows, spacing: 20) {
                    ColorSelectionItem(color: "red")
                        .onTapGesture {
                            categoryColor = "red"
                        }
                    ColorSelectionItem(color: "blue")
                        .onTapGesture {
                            categoryColor = "blue"
                        }
                    ColorSelectionItem(color: "green")
                        .onTapGesture {
                            categoryColor = "green"
                        }
                    ColorSelectionItem(color: "yellow")
                        .onTapGesture {
                            categoryColor = "yellow"
                        }
                    ColorSelectionItem(color: "pink")
                        .onTapGesture {
                            categoryColor = "pink"
                        }
                    ColorSelectionItem(color: "orange")
                        .onTapGesture {
                            categoryColor = "orange"
                        }
                    ColorSelectionItem(color: "turquoise")
                        .onTapGesture {
                            categoryColor = "turquoise"
                        }
                    ColorSelectionItem(color: "violet")
                        .onTapGesture {
                            categoryColor = "violet"
                        }
                }
                .padding(15)
                .background(Color("ElementsColor"))
                .cornerRadius(15)
                
            }
            ImageCarouselView(images: images, selectedImage: $categoryIcon, selectedColor: $categoryColor)
            HStack {
                Spacer()
                Button(action: {
                    let category = CategoryModel(name: categoryName, color: categoryColor, icon: categoryIcon)
                    spendsVM.insertCategory(category)
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
            }
            Spacer()
        }
    }
}
