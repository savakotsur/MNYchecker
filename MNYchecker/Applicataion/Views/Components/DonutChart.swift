//
//  DonutChart.swift
//  MNYchecker
//
//  Created by Савелий Коцур on 15.05.2024.
//

import SwiftUI
import Charts

struct DonutChart: View {
    let categories: [(category: String, value: Double)]
    @State private var animationProgress: CGFloat = 0
    
        private let chartSize: CGFloat = 100
        private let lineWidth: CGFloat = 100
    private let centerPoint: CGPoint = CGPoint(x: screenSize.midX, y: screenSize.height / 6)
    private let radius: CGFloat = screenSize.width / 3
    
    var body: some View {
        ZStack {
            //            Circle()
            //                .stroke(Color.white, lineWidth: lineWidth)
            //                .frame(width: chartSize, height: chartSize)
            
            ForEach(categories.indices.reversed(), id: \.self) { index in
                let startAngle = Angle(degrees: 90 - (360 * categories.prefix(index + 1).map { $0.value }.reduce(0, +)) / totalValue)
                let endAngle = Angle(degrees: 90 - (360 * categories.prefix(index).map { $0.value }.reduce(0, +)) / totalValue)
                
                DonutSlice(
                    id: index,
                    start: startAngle,
                    end: endAngle,
                    color: chartColors[index % chartColors.count],
                    center: centerPoint,
                    radius: radius
                )
                .animation(.easeInOut(duration: 1), value: animationProgress)
            }
            Circle()
                .stroke(Color.white, lineWidth: lineWidth)
                .frame(width: chartSize, height: chartSize)
                .padding(.bottom, screenSize.width / 4.3)
            Text(String(totalValue) + "$")
                .padding(.bottom, screenSize.width / 4.3)
        }
        .onAppear {
            withAnimation {
                animationProgress = 1
            }
        }
    }
    
    private var totalValue: Double {
        categories.reduce(0, { $0 + $1.value })
    }
    
    private let chartColors: [Color] = [
        .red, .orange, .pink, .blue, .yellow, .green, .purple, .mint, .cyan, .indigo
    ]
}

struct DonutSlice: View, Identifiable {
    let id: Int
    let start: Angle
    let end: Angle
    let color: Color
    let center: CGPoint
    let radius: CGFloat
    
    var body: some View {
        Path { path in
            path.move(to: center)
            path.addArc(center: center, radius: radius, startAngle: start, endAngle: end, clockwise: false)
            path.addLine(to: center)
        }
        .fill(color)
    }
}
