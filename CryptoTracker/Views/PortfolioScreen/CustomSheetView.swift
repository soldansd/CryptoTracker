//
//  CustomSheetView.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 29/08/2024.
//

import SwiftUI

struct CustomSheetView<Content: View>: View {
    
    let confirmTitle: String
    let confrimIsAble: Bool
    @Binding var showSheet: Bool
    let confirmAction: () -> ()
    @ViewBuilder let content: Content
    
    init(
        confirmTitle: String,
        confrimIsAble: Bool,
        showSheet: Binding<Bool>,
        confirmAction: @escaping () -> Void,
        @ViewBuilder content: () -> Content
    ) {
        self.confirmTitle = confirmTitle
        self.confrimIsAble = confrimIsAble
        self._showSheet = showSheet
        self.confirmAction = confirmAction
        self.content = content()
    }
    
    var body: some View {
        VStack {
            
            HStack {
                CancelSheetButtonView(showSheet: $showSheet)
                
                Spacer()
                
                Button {
                    confirmAction()
                    showSheet = false
                } label: {
                    Text(confirmTitle)
                }
                .disabled(!confrimIsAble)
            }
            .padding()
            .padding(.vertical)
            
            content
        }
    }
}

#Preview {
    CustomSheetView(confirmTitle: "Confirm", confrimIsAble: true, showSheet: .constant(true), confirmAction: {}, content: {})
}
