//
//  CustomButtonView.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 22/08/2024.
//

import SwiftUI

struct CustomButtonView: View {
    
    let title: String
    let action: () -> ()
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(.headline)
                .padding(8)
                .background(.gray.opacity(0.45))
                .clipShape(RoundedRectangle(cornerRadius: 7))
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    HStack {
        CustomButtonView(title: "100", action: {})
    }
}
