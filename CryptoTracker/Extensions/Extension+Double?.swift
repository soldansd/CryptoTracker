//
//  Extension+Double?.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 22/08/2024.
//

import Foundation

extension Double? {
    
    func toPercentString() -> String {
        guard let self else { return "—" }
        guard let str = NumberFormatter.percentFormatter.string(for: self) else { return "—" }
        return str + " %"
    }
    
    func toAbbreviationString() -> String {
        guard let self else { return "—"}
        return self.formatted(.number.notation(.compactName)) + " $"
    }
}
