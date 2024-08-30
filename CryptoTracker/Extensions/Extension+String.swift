//
//  Extension+String.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 24/08/2024.
//

import Foundation

extension String {
    
    func removeHTMLLinks() -> String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression)
    }
}
