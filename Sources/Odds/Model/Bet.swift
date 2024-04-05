public class Bet {
    public var name: String
    public var sellIn: Int
    public var quality: Int
    
    // MARK: - CONSTRUCTOR -
    public init(name: String, sellIn: Int, quality: Int) {
        self.name = name
        self.sellIn = sellIn
        self.quality = quality
    }
    
    // MARK: - EXPOSED FUNCTIONS -
    public func update() {
        updateQuality()
        updateSellIn()
        handleNegativeSellInIfNeed()
    }
    
    struct Constants {
        static let playerPerformance = "Player performance"
        static let totalScore = "Total score"
        static let winningTeam = "Winning team"
    }
}

// MARK: - ASSISTANT -
extension Bet {
    private func updateSellIn() {
        if name != Constants.winningTeam {
            sellIn -= 1
        }
    }
    
    private func increaseQualityIfNeeded(_ amount: Int = 1) {
        if quality < 50 {
            quality += amount
        }
    }
    
    private func decreaseQualityIfNeeded(_ amount: Int = 1) {
        if quality > 0 {
            quality -= amount
        }
    }
    
    private func updateQuality() {
        switch name {
        case Constants.playerPerformance:
            increaseQualityIfNeeded()
        case Constants.totalScore:
            updateTotalScoreQuality()
        case Constants.winningTeam:
            break
        default:
            decreaseQualityIfNeeded()
        }
    }
    
    private func handleNegativeSellInIfNeed() {
        guard sellIn < 0 else { return }
        
        switch name {
        case Constants.totalScore:
            quality = 0
        case Constants.playerPerformance:
            increaseQualityIfNeeded()
        default:
            decreaseQualityIfNeeded()
        }
    }
    
    private func updateTotalScoreQuality() {
        increaseQualityIfNeeded()
        if sellIn < 11 {
            increaseQualityIfNeeded()
        }
        if sellIn < 6 {
            increaseQualityIfNeeded()
        }
    }
}

public typealias Bets = [Bet]
