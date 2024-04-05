//
//  BetsTests.swift
//  BetsTests
//
//  Created by Hugo Coutinho on 2024-04-05.
//

import XCTest
import Combine
@testable import Odds

final class BetsViewModelTests: XCTestCase {
    
    private var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        cancellables = []
    }
    
    @MainActor
    func test_viewModelNotRetained() async {
        // 1. GIVEN
        var sut: BetsViewModel? = makeSUT()
        
        // 2. WHEN
        await sut?.updateOdds()
        weak var sutWeak = sut
        sut = nil
        
        // 3. THEN
        XCTAssertNil(sutWeak, "ViewModel not deallocated. Potential memory leak!")
    }
    
    @MainActor
    func test_shouldLoadBets() async {
        // 1. GIVEN
        let expectedFirstName = "Winning team"
        let expectedSecondName = "Total score"
        let sut: BetsViewModel = makeSUT()
        let expectation = self.expectation(description: "BetsViewModel")
        
        // 2. WHEN
        sut.$odds
            .sink(receiveCompletion: {_ in }, receiveValue: { odds in
                guard odds.count > 1 else { return }
                
                expectation.fulfill()
            })
            .store(in: &cancellables)
        
        await fulfillment(of: [expectation], timeout: 10)
        
        // 3. THEN
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.odds.count, 16)
        XCTAssertEqual(sut.odds.first?.name, expectedFirstName)
        XCTAssertEqual(sut.odds[1].name, expectedSecondName)
    }
    
    @MainActor
    func test_shouldLoadBetsFail() async {
        // 1. GIVEN
        let sut: BetsViewModel = makeSUTErrorHandler()
        let expectation = self.expectation(description: "BetsViewModel")
        
        // 2. WHEN
        sut.$odds
            .map(\.first?.name)
            .removeDuplicates()
            .sink(receiveCompletion: {_ in }, receiveValue: { odds in
                expectation.fulfill()
            })
            .store(in: &cancellables)
        
        await fulfillment(of: [expectation], timeout: 10)
        
        // 3. THEN
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.odds.count, 0)
    }
}

// MARK: - MAKE SUT -
extension BetsViewModelTests {
    @MainActor
    private func makeSUT() -> BetsViewModel {
        return BetsViewModel(service: RemoteBetService.instance)
    }
    
    @MainActor
    private func makeSUTErrorHandler() -> BetsViewModel {
        return BetsViewModel(service: BetsServiceErrorHandlerSpy())
    }
}
