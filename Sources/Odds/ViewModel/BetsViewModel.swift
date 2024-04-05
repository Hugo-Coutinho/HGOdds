//
//  BetsViewModel.swift
//  Bets
//
//  Created by Hugo Coutinho on 2024-04-04.
//

import Foundation

@MainActor
public class BetsViewModel {
    // MARK: - PROPERTIES -
    @Published public var odds: Odds = []
    private var bets: Bets = []
    private var service: BetService
    
    // MARK: - CONSTRUCTOR -
    public init(service: BetService) {
        self.service = service
        fetchBets()
    }
    
    // MARK: - EXPOSED FUNCTIONS -
    public func updateOdds() async {
        bets.forEach{( $0.update() )}
        fetchNames()
        try? await service.saveBets(bets)
    }
}

// MARK: - ASSISTANT -
extension BetsViewModel {
    private func fetchBets() {
        Task {
            bets = try await service.loadBets()
            fetchNames()
        }
    }
    
    private func fetchNames() {
        odds = bets
            .map({ (bet) -> Odd in
                let sellIn = "Sell in: \(bet.sellIn)"
                let quality = "Quality: \(bet.quality)"
                
                return Odd(name: bet.name, quality: quality, sellIn: sellIn)
            })
    }
}

public struct Odd {
    public var name, quality, sellIn: String
}

public typealias Odds = [Odd]
