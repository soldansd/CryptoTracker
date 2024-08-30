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
    
    // MARK: Method returns a list of the top coins based on market cap
    func getCoinsList(amount: Int, completionHandler: @escaping ([Coin]) -> Void) {
        
        let queryParameters = [
            URLQueryItem(name: "vs_currency", value: "usd"),
            URLQueryItem(name: "per_page", value: "\(amount)"),
            URLQueryItem(name: "x_cg_demo_api_key", value: "\(APICredentials.API_KEY)")
        ]
        
        getCoins(queryParameters: queryParameters, completionHandler: completionHandler)
    }
    
    // MARK: Method returns a list of coins based on given ids of coins
    func getPortfolio(ids: [String], completionHandler: @escaping ([Coin]) -> Void) {
        
        let queryParameters = [
            URLQueryItem(name: "vs_currency", value: "usd"),
            URLQueryItem(name: "ids", value: ids.joined(separator: ",")),
            URLQueryItem(name: "x_cg_demo_api_key", value: "\(APICredentials.API_KEY)")
        ]
        
        getCoins(queryParameters: queryParameters, completionHandler: completionHandler)
    }
    
    // MARK: Method returns a list of coins based on query parameters
    private func getCoins(queryParameters: [URLQueryItem]? = nil, completionHandler: @escaping ([Coin]) -> Void) {
        let urlString = baseURL + "/coins/markets"
       
        getRequest(urlString: urlString, queryParameters: queryParameters) { (result: Result<[Coin], Error>) in
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
    
    // MARK: Method returns current maket data
    func getMarketData(completionHandler: @escaping (MarketData?) -> () ) {
        
        let urlString = baseURL + "/global"
        let queryParameters = [URLQueryItem(name: "x_cg_demo_api_key", value: "\(APICredentials.API_KEY)")]
        
        getRequest(urlString: urlString, queryParameters: queryParameters) { (result: Result<MarketData, Error>) in
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
    
    // MARK: Method returns coin with detail information about it
    func getCoinDetail(id: String, completionHandler: @escaping (CoinDetail?) -> Void) {
        
        let urlString = baseURL + "/coins/\(id)"
        let queryParameters = [
            URLQueryItem(name: "localization", value: "false"),
            URLQueryItem(name: "tickers", value: "false"),
            URLQueryItem(name: "market_data", value: "true"),
            URLQueryItem(name: "community_data", value: "false"),
            URLQueryItem(name: "developer_data", value: "false"),
            URLQueryItem(name: "sparkline", value: "true"),
            URLQueryItem(name: "x_cg_demo_api_key", value: "\(APICredentials.API_KEY)")
        ]
        
        getRequest(urlString: urlString, queryParameters: queryParameters) { (result: Result<CoinDetail, Error>) in
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
    
    // MARK: Method returns all coins available from API
    func getCoinsForSearch(completionHandler: @escaping ([CoinSearch]) -> Void) {
        
        let urlString = baseURL + "/coins/list"
        let queryParameters = [URLQueryItem(name: "x_cg_demo_api_key", value: "\(APICredentials.API_KEY)")]
        
        getRequest(urlString: urlString, queryParameters: queryParameters) { (result: Result<[CoinSearch], Error>) in
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
    
    // MARK: This is a generic GET request with query parameters
    private func getRequest<T: Decodable>(urlString: String, queryParameters: [URLQueryItem]? = nil, completionHandler: @escaping (Result<T, Error>) -> Void) {
        
        var components = URLComponents(string: urlString)
        components?.queryItems = queryParameters
        
        guard let url = components?.url else {
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
