//
//  ContentView.swift
//  MNYchecker
//
//  Created by Савелий Коцур on 18.03.2024.
//

import SwiftUI

struct SpendsView: View {
    
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
                .padding(.horizontal, 16.0)
                .padding(.vertical, 1.0)
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
                .padding(.horizontal, 16.0)
                .padding(.vertical, 4.0)
                .background(Color("ElementsColor"))
                .cornerRadius(100)
            }
            .padding()
            
            Spacer()
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
