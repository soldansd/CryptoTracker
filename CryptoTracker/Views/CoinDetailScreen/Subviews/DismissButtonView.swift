//
//  DismissButtonView.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 24/08/2024.
//

import SwiftUI

struct DismissButtonView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button {
            dismiss()
        } label: {
             Image(systemName: "chevron.left")
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    DismissButtonView()
}
