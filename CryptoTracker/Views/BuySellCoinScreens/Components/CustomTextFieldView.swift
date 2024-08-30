//
//  CustomTextFieldView.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 29/08/2024.
//

import SwiftUI

struct CustomTextFieldView: View {
    
    let placeholder: String
    @Binding var input: String
    
    var body: some View {
        TextField(placeholder, text: $input)
            .font(.largeTitle)
            .padding()
            .keyboardType(.decimalPad)
            .background(.regularMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    CustomTextFieldView(placeholder: "Enter", input: .constant("10"))
}
