//
//  LoadingView.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 24/08/2024.
//

import SwiftUI

struct LoadingView: View {
    
    let title: String
    
    var body: some View {
        VStack(spacing: 30) {
            ProgressView()
                .scaleEffect(CGSize(width: 1.5, height: 1.5))
                
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .fontDesign(.rounded)
        }
    }
}

#Preview {
    LoadingView(title: "Loading coin's data")
}
