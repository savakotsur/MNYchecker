//
//  SpendDetails.swift
//  MNYchecker
//
//  Created by Савелий Коцур on 06.04.2024.
//

import SwiftUI

struct SpendDetails: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var spendsVM: SpendsViewModel
    var spend : SpendModel
    
    var body: some View {
        VStack (alignment: .center) {
            HStack (alignment: .center) {
                Image(systemName: spend.category.icon)
                    .foregroundColor(Color(spend.category.color))
                    .imageScale(.large)
                VStack (alignment: .leading) {
                    Text(spend.title)
                        .fontWeight(.bold)
                    Text(spend.date.formatted(date: .abbreviated, time: .omitted))
                }
                Spacer()
                Text(String(spend.value) + "$")
            }.padding(15)
            Text(spend.description)
                .padding(15)
                .frame(maxWidth: 400, maxHeight: 400)
                .background(Color("ElementsColor"))
                .cornerRadius(20)
                .padding(15)
            HStack {
                Spacer()
                Button(action: {
                    spendsVM.deleteSpend(spend)
                    dismiss()
                }) {
                Label {
                    Text("Delete")
                } icon: {
                    Image(systemName: "trash")
                        .imageScale(.large)
                        .foregroundColor(Color.red)
                }
                .labelStyle(.iconOnly)
            }
            .frame(width: screenSize.width / 6.0, height: screenSize.height / 24.0)
            .background(Color("ElementsColor"))
            .cornerRadius(100)
            .padding(.horizontal, 20)
            }
        }
    }
}

//struct SpendDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        SpendDetails()
//    }
//}
