//
//  DetailsView.swift
//  MNYchecker
//
//  Created by Савелий Коцур on 24.07.2024.
//

import SwiftUI

struct DetailsView: View {
    @StateObject var detailsVM = DetailsViewModel()
    @ObservedObject var spendsVM: SpendsViewModel
    @State private var selectedMonth: Int = Calendar.current.component(.month, from: Date())
    @State private var selectedYear: Int = Calendar.current.component(.year, from: Date())
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack (alignment: .topLeading) {
            Button(action: {
                dismiss()
            })
            {
                Label {
                    Text("Close")
                } icon: {
                    Image(systemName: "xmark")
                        .imageScale(.large)
                }
                .labelStyle(.iconOnly)
            }
            .padding(15)
            
            VStack {
                DonutChart(categories: detailsVM.spendCategoriesValuesForSelectedMonth)
                    .onAppear {
                        detailsVM.updateSpendCategoriesValues(selectedMonth: selectedMonth, selectedYear: selectedYear, spends: spendsVM.spends)
                    }
                HStack (alignment: .center) {
                    Spacer()
                    Picker("Месяц", selection: $selectedMonth) {
                        ForEach(1..<13) { month in
                            Text(detailsVM.formattedMonthName(month: month)).tag(month)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .onChange(of: selectedMonth) { _ in
                        detailsVM.updateSpendCategoriesValues(selectedMonth: selectedMonth, selectedYear: selectedYear, spends: spendsVM.spends)
                    }
                    
                    Picker("Год", selection: $selectedYear) {
                        ForEach(2016..<2030) { year in
                            Text(String(year)).tag(year)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .onChange(of: selectedYear) { _ in
                        detailsVM.updateSpendCategoriesValues(selectedMonth: selectedMonth, selectedYear: selectedYear, spends: spendsVM.spends)
                    }
                    
                    Spacer()
                }
                Spacer()
            }
        }
    }
}
