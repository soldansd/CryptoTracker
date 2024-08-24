//
//  ChartView.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 23/08/2024.
//

import SwiftUI
import Charts

struct ChartView: View {
    
    let data: [Double]
    
    var body: some View {
        Chart {
            ForEach(data.indices, id: \.self) { index in
                LineMark(x: .value("", index), y: .value("Price", data[index]))
            }
        }
        .chartXAxis(.hidden)
        .chartYScale(domain: minElement...maxElement)
        .foregroundStyle(chartColor)
        .frame(minHeight: 240, maxHeight: 280)
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
    ChartView(data: [1,3,4, 0.6, 3])
}
