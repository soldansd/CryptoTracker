//
//  CancelSheetButtonView.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 29/08/2024.
//

import SwiftUI

struct CancelSheetButtonView: View {
    
    @Binding var showSheet: Bool
    
    var body: some View {
        Button {
            showSheet = false
        } label: {
            Text("Cancel")
        }
    }
}

#Preview {
    CancelSheetButtonView(showSheet: .constant(true))
}
