//
//  CoreDataManager.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 27/08/2024.
//

import Foundation
import CoreData

final class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    private let container: NSPersistentContainer
    private var coinsPortfolio: [CoinPortfolio] = []
    private let containerName = "Portfolio"
    private let entityName = "CoinPortfolio"
    
    private var context: NSManagedObjectContext {
        container.viewContext
    }
    
    private init() {
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { _, error in
            if let error {
                print("DEBUG: Can not load Core Data. Error: \(error)")
            }
        }
        fetchPortfolio()
    }
    
    func getPortfolio() -> [(id: String, amount: Double)] {
        var portfolio: [(id: String, amount: Double)] = []
        
        for coin in coinsPortfolio {
            if let id = coin.id {
                let pair = (id: id, amount: coin.amount)
                portfolio.append(pair)
            }
        }
        
        return portfolio
    }
    
    func updatePortfolio(coinId id: String, amount: Double) {
        guard amount >= 0 else { return }
  
        if coinsPortfolio.contains(where: {$0.id == id}) {
            if amount > 0 {
                update(coinId: id, amount: amount)
            } else {
                delete(coinId: id)
            }
        } else {
            create(coinId: id, amount: amount)
        }
        
        saveAndRefetchPortfolio()
    }
    
    private func fetchPortfolio() {
        let request = NSFetchRequest<CoinPortfolio>(entityName: entityName)
        do {
            coinsPortfolio = try context.fetch(request)
        } catch {
            print("DEBUG: Can not fetch portfolio coins from Core Dara. Error: \(error)")
        }
    }
    
    private func create(coinId id: String, amount: Double) {
        let coinPortfolio = CoinPortfolio(context: context)
        coinPortfolio.id = id
        coinPortfolio.amount = amount
    }
    
    private func update(coinId id: String, amount: Double) {
        guard let coin = coinsPortfolio.first(where: {$0.id == id}) else { return }
        coin.amount = amount
    }
    
    private func delete(coinId id: String) {
        guard let coin = coinsPortfolio.first(where: {$0.id == id}) else { return }
        context.delete(coin)
    }
    
    private func save() {
        do {
            try context.save()
        } catch {
            print("DEBUG: Can not save portfolio coins to Core Data. Error: \(error)")
        }
    }
    
    private func saveAndRefetchPortfolio() {
        save()
        fetchPortfolio()
    }
    
}
