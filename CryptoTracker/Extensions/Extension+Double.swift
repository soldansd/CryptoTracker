//
//  Extension+Double.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 22/08/2024.
//

import Foundation

extension Double {
    
    func toPriceShortString() -> String {
        return NumberFormatter.shortPriceFormatter.string(for: self) ?? "—"
    }

    func toPriceString() -> String {
        return NumberFormatter.priceFormatter.string(for: self) ?? "—"
    }
    
    func toPercentString() -> String {
        guard let str = NumberFormatter.percentFormatter.string(for: self) else { return "—" }
        return (str.first == "-" ? str : "+" + str) + " %"
    }
    
    func toAbbreviationString(withCurency: Bool = true) -> String {
        var formattedString = self.formatted(.number.notation(.compactName))
        if withCurency {
            formattedString += " $"
        }
        return formattedString
    }
}
