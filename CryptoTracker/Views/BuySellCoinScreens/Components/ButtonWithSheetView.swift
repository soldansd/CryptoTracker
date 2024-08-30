//
//  ButtonWithSheetView.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 29/08/2024.
//

import SwiftUI

struct ButtonWithSheetView<Content: View>: View {
    
    let title: String
    @ViewBuilder let sheetContent: (Binding<Bool>) -> Content
    @State private var showSheet = false
    
    var body: some View {
        CustomButtonView(title: title) {
            showSheet = true
        }
        .sheet(isPresented: $showSheet) {
            sheetContent($showSheet)
        }
    }
}

#Preview {
    NavigationStack {
        ButtonWithSheetView(title: "buy") { _ in 
        
        }
    }
}
