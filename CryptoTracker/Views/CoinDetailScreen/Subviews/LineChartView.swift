//
//  ChartView.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 23/08/2024.
//

import SwiftUI
import Charts

struct LineChartView: View {
    
    let data: [Double]
    
    var body: some View {
        GroupBox("7 days' chart") {
            Chart {
                ForEach(data.indices, id: \.self) { index in
                    LineMark(x: .value("", index), y: .value("Price", data[index]))
                }
            }
            .chartXAxis(.hidden)
            .chartYScale(domain: minElement...maxElement)
            .foregroundStyle(chartColor)
            
        }
        .backgroundStyle(.regularMaterial)
        .frame(minHeight: 260, maxHeight: 300)
    }
    
    private var minElement: Double {
        data.min() ?? 0
    }
    
    private var maxElement: Double {
        data.max() ?? 0
    }
    
    private var chartColor: Color {
        guard let first = data.first, let last = data.last, first != last else {
            return .secondary
        }
        
        if first < last {
            return .green
        } else {
            return .red
        }
    }
}

#Preview {
    LineChartView(data: [1, 3, 4, 0.6, 3])
}
