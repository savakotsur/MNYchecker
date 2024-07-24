//
//  DetailsView.swift
//  MNYchecker
//
//  Created by Савелий Коцур on 24.07.2024.
//

import SwiftUI

struct DetailsView: View {
    var namespace: Namespace.ID
    @ObservedObject var spendsVM: SpendsViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            DonutChart(categories: spendsVM.spendCategoriesValues)
                .matchedGeometryEffect(id: "mainchart", in: namespace)
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        dismiss()
                    }
                }
        }
    }
}
