//
//  ContentView.swift
//  MNYchecker
//
//  Created by Савелий Коцур on 18.03.2024.
//

import SwiftUI

struct SpendsView: View {
    
    @StateObject var spendsVM = SpendsViewModel();
    @Namespace var namespace
    @State var isAddingSpend = false
    @State var isSettingsOpened = false
    @State var isDetailsOpened = false
    @State var selectedSpend: SpendModel?
    
    var body: some View {
        VStack {
            Button(action: {
                withAnimation(.easeInOut) {
                    isDetailsOpened.toggle()
                }
            }) {
                DonutChart(categories: spendsVM.spendCategoriesValues)
                    .matchedGeometryEffect(id: "mainchart", in: namespace)
                    .foregroundColor(.black)
            }
            
            
            HStack {
                Spacer()
                Button(action: {
                    isSettingsOpened.toggle()
                })
                {
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
                .sheet(isPresented: $isSettingsOpened) {
                    SettingsView()
                }
                
                Button(action: {
                    isAddingSpend.toggle()
                })
                {
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
            .padding(.top, -80)
            .padding(.horizontal, 20)
            .sheet(isPresented: $isAddingSpend) {
                AddSpendView(spendsVM: spendsVM)
            }
            
            //List with all spends
            List {
                if spendsVM.spends.isEmpty {
                    HStack (alignment: .center) {
                        Spacer()
                        ProgressView()
                            .frame(minWidth: 350, maxWidth: 500, minHeight: 570, maxHeight: 1000)
                            .background(Color("ElementsColor"))
                            .cornerRadius(20)
                    }
                    .listRowSeparator(.hidden)
                }
                ForEach(spendsVM.spends) { spend in
                    Button (action: {
                        selectedSpend = spend
                    }) {
                        SpendDesign(title: spend.title, value: spend.value, category: spend.category, date: spend.date)
                    }
                }
                .listRowSeparator(.hidden)
            }.listStyle(.inset)
                .padding(.top, -40)
                .sheet(item: $selectedSpend) { spend in
                    SpendDetails(spendsVM: spendsVM, spend: spend)
                }
        }
        .fullScreenCover(isPresented: $isDetailsOpened) {
            DetailsView(namespace: namespace, spendsVM: spendsVM)
        }
    }
}
