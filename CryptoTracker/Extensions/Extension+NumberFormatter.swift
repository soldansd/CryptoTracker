//
//  Extension+NumberFormatter.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 22/08/2024.
//

import Foundation

extension NumberFormatter {
    
    static var shortPriceFormatter: NumberFormatter = createPriceFormetter(isShort: true)
    
    static var priceFormatter: NumberFormatter = createPriceFormetter()
    
    static var percentFormatter: NumberFormatter = {
        let formater = NumberFormatter()
        formater.usesGroupingSeparator = true
        formater.numberStyle = .decimal
        formater.minimumFractionDigits = 2
        formater.maximumFractionDigits = 2
        return formater
    }()
    
    private static func createPriceFormetter(isShort: Bool = false) -> NumberFormatter {
        let formater = NumberFormatter()
        formater.usesGroupingSeparator = true
        formater.numberStyle = .currency
        formater.minimumFractionDigits = 2
        formater.maximumFractionDigits = isShort ? 2 : 8
        formater.currencyCode = "usd"
        formater.currencySymbol = "$"
        return formater
    }
}
