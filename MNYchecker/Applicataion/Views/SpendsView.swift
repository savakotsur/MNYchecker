//
//  ContentView.swift
//  MNYchecker
//
//  Created by Савелий Коцур on 18.03.2024.
//

import SwiftUI

struct SpendsView: View {
    
    @StateObject var spendsVM = SpendsViewModel();
    @State var isAddingSpend = false
    @State var isSettingsOpened = false
    
    var body: some View {
        VStack {
            
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Здесь будет диаграмма")
            
            //Buttons "Settings" and "Add"
            HStack {
                Spacer()
                Button(action: printSmth) {
                    Label {
                        Text("Settings")
                    } icon: {
                        Image(systemName: "gear")
                            .imageScale(.large)
                    }
                    .labelStyle(.iconOnly)
                }
                .frame(width: screenSize.width / 6.0, height: screenSize.height / 24.0)
                .background(Color("ElementsColor"))
                .cornerRadius(100)
                Button(action: printSmth) {
                    Label {
                        Text("Add Spend")
                    } icon: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                    }
                    .labelStyle(.iconOnly)
                }
                .frame(width: screenSize.width / 6.0, height: screenSize.height / 24.0)
                .background(Color("ElementsColor"))
                .cornerRadius(100)
            }
            .padding(10.0)
            
            if spendsVM.spends.isEmpty {
                ProgressView()
            }
            else {
                List {
                    ForEach(spendsVM.spends) { spend in
                            HStack {
                                VStack {
                                    Text(spend.title)
                                    Text(spend.id)
                                    Text(String(spend.value))
                                }
                                Spacer()
                                Text("ADD DATE")
                            }
                    }
                }.listStyle(.automatic)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .padding(.top, 40)
    }
}

//DELETE THIS
func printSmth() {
    print("Wow")
}

struct SpendsView_Previews: PreviewProvider {
    static var previews: some View {
        SpendsView()
    }
}
