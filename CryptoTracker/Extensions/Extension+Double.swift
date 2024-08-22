//
//  Extension+Double.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 22/08/2024.
//

import Foundation

extension Double {

    func toPriceString() -> String {
        return NumberFormatter.priceFormatter.string(for: self) ?? "—"
    }
    
    func toPercentString() -> String {
        guard let str = NumberFormatter.percentFormatter.string(for: self) else { return "—" }
        return (str.first == "-" ? str : "+" + str) + " %"
    }
    
    func toAbbreviationString() -> String {
        return self.formatted(.number.notation(.compactName)) + " $"
    }
}
