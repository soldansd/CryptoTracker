//
//  NetworkError.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 23/08/2024.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case invalidResponse
    case noData
    case other(statusCode: Int)
    
    var description: String {
        switch self {
        case .badURL:
            return "Invalid URL. Please check it is correct"
        case .invalidResponse:
            return "Invalid response received from server"
        case .noData:
            return "Response does not have body's data"
        case .other(let statusCode):
            return "Network error. Status code: \(statusCode)"
        }
    }
}
