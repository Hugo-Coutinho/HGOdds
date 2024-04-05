//
//  ServiceSpy.swift
//  BetsCoreTests
//
//  Created by Hugo Coutinho on 2024-04-05.
//

import Odds

class BetsServiceErrorHandlerSpy: BetService {
    func loadBets() async throws -> [Bet] {
        return []
    }
    
    func saveBets(_ bets: [Bet]) async throws {
        
    }
}

