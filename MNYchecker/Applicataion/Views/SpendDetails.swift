//
//  SpendDetails.swift
//  MNYchecker
//
//  Created by Савелий Коцур on 06.04.2024.
//

import SwiftUI

struct SpendDetails: View {
    
    var spend : SpendModel
    
    var body: some View {
        VStack (alignment: .center) {
            HStack (alignment: .top) {
                Image(systemName: "gear")
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
        }
    }
}

//struct SpendDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        SpendDetails()
//    }
//}
