//
//  BetsCoordinator.swift
//  Bets
//
//  Created by Hugo Coutinho on 2024-04-04.
//

import Foundation

public protocol BetsCoordinatorInput {
    func makeViewModel() -> BetsViewModel
}

public class BetsCoordinator: BetsCoordinatorInput {
    
    // MARK: - CONSTRUCTOR -
    public init() {}
    
    @MainActor
    public func makeViewModel() -> BetsViewModel {
        return BetsViewModel(service: RemoteBetService.instance)
    }
}
