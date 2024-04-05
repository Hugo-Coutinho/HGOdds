//
//  BetModelTests.swift
//  BetsTests
//
//  Created by Hugo Coutinho on 2024-04-05.
//

import XCTest
import Combine
@testable import Odds

final class BetsModelTests: XCTestCase {
    
    func test_shouldPlayerPerformanceIncreaseQuality() async {
        // 1. GIVEN
        let expectedQuality = 5
        let sut = Bet(name: "Player performance", sellIn: 9, quality: 4)
        
        // 2. WHEN
        sut.update()
        
        // 3. THEN
        XCTAssertEqual(sut.quality, expectedQuality)
    }
    
    func test_shouldTotalScoreIncreaseQuality() async {
        // 1. GIVEN
        let expectedQuality = 29
        let sut = Bet(name: "Total score", sellIn: 5, quality: 26)
        
        // 2. WHEN
        sut.update()
        
        // 3. THEN
        XCTAssertEqual(sut.quality, expectedQuality)
    }
    
    func test_shouldWinningTeamNotChangedQuality() async {
        // 1. GIVEN
        let expectedQuality = 15
        let sut = Bet(name: "Winning team", sellIn: 8, quality: 15)
        
        // 2. WHEN
        sut.update()
        
        // 3. THEN
        XCTAssertEqual(sut.quality, expectedQuality)
    }
}
