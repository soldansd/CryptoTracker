//
//  NetworkManager.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 22/08/2024.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let baseURL = "https://api.coingecko.com/api/v3"
    private let decoder = JSONDecoder()
    
    private init() {}
    
    func getCoinsList(amount: Int, completionHandler: @escaping ([Coin]) -> Void) {
        let urlString = baseURL + "/coins/markets?vs_currency=usd&per_page=\(amount)&x_cg_demo_api_key=\(APICredentials.API_KEY)"
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                print("DEBUG: Error in getCoinsList: \(error.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("DEBUG: Incorrect response in getCoinsList")
                return
            }
            
            guard response.statusCode == 200 else {
                print("DEBUG: Response code in getCoinsList \(response.statusCode)")
                return
            }
            
            guard let data else {
                print("DEBUG: No data in getCoinsList")
                return
            }

            do {
                let coins = try self.decoder.decode([Coin].self, from: data)
                completionHandler(coins)
            } catch {
                print("DEBUG: Failed to decode in getCoinsList with error: \(error.localizedDescription)")
            }
        }
        
        task.resume()
    }
}
