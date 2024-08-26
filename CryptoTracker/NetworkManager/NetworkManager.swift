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
    
    private init() {}
    
    func getCoinsList(amount: Int, completionHandler: @escaping ([Coin]) -> Void) {
        
        let urlString = baseURL + "/coins/markets?vs_currency=usd&per_page=\(amount)&x_cg_demo_api_key=\(APICredentials.API_KEY)"
       
        getRequest(urlString: urlString) { (result: Result<[Coin], Error>) in
            switch result {
            case .success(let success):
                completionHandler(success)
            case .failure(let failure as NetworkError):
                print("DEBUG:" + failure.description + " in getMarketData")
                completionHandler([])
            case .failure(let failure):
                print("DEBUG: \(failure) in getMarketData")
                completionHandler([])
            }
        }
    }
    
    func getMarketData(completionHandler: @escaping (Market?) -> () ) {
        
        let urlString = "https://api.coingecko.com/api/v3/global?x_cg_demo_api_key=\(APICredentials.API_KEY)"
        
        getRequest(urlString: urlString) { (result: Result<Market, Error>) in
            switch result {
            case .success(let success):
                completionHandler(success)
            case .failure(let failure as NetworkError):
                print("DEBUG:" + failure.description + " in getMarketData")
                completionHandler(nil)
            case .failure(let failure):
                print("DEBUG: \(failure) in getMarketData")
                completionHandler(nil)
            }
        }
    }
    
    func getCoinDetail(id: String, completionHandler: @escaping (CoinDetail?) -> Void) {
        let urlString = "https://api.coingecko.com/api/v3/coins/\(id)?localization=false&tickers=false&market_data=true&community_data=false&developer_data=false&sparkline=true&x_cg_demo_api_key=\(APICredentials.API_KEY)"
        
        getRequest(urlString: urlString) { (result: Result<CoinDetail, Error>) in
            switch result {
            case .success(let success):
                completionHandler(success)
            case .failure(let failure as NetworkError):
                print("DEBUG:" + failure.description + " in getCoin id:" + id)
                completionHandler(nil)
            case .failure(let failure):
                print("DEBUG: \(failure) in getCoin id: " + id)
                completionHandler(nil)
            }
        }
    }
    
    func getCoinsForSearch(completionHandler: @escaping ([CoinSearch]) -> Void) {
        let urlString = "https://api.coingecko.com/api/v3/coins/list?x_cg_demo_api_key=\(APICredentials.API_KEY)"
        
        getRequest(urlString: urlString) { (result: Result<[CoinSearch], Error>) in
            switch result {
            case .success(let success):
                completionHandler(success)
            case .failure(let failure as NetworkError):
                print("DEBUG:" + failure.description + " in getCoinsForSearch")
                completionHandler([])
            case .failure(let failure):
                print("DEBUG: \(failure) in getCoinsForSearch")
                completionHandler([])
            }
        }
    }
    
    private func getRequest<T: Decodable>(urlString: String, completionHandler: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(NetworkError.badURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                completionHandler(.failure(error))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completionHandler(.failure(NetworkError.invalidResponse))
                return
            }
            
            guard response.statusCode == 200 else {
                completionHandler(.failure(NetworkError.other(statusCode: response.statusCode)))
                return
            }
            
            guard let data else {
                completionHandler(.failure(NetworkError.noData))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completionHandler(.success(decodedData))
            } catch {
                completionHandler(.failure(error))
            }
        }
        
        task.resume()
    }
}
