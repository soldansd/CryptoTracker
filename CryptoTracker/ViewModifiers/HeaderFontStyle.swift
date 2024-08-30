//
//  ExtraLargeFontStyle.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 30/08/2024.
//

import Foundation
import SwiftUI

struct HeaderFontStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .fontWeight(.bold)
            .fontDesign(.rounded)
    }
}
