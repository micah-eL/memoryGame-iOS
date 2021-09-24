import SwiftUI


class MemoryGameViewModel: ObservableObject {
    static var tmp: Int = 8
    init (tmp: Int) {
        MemoryGameViewModel.tmp = tmp
    }
    
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["🐱", "🐶", "🐰", "🐹", "🦔", "🐿", "🦊", "🦝", "🐻", "🐼", "🐨", "🐷", "🐮", "🐴", "🦄", "🦋", "🐍", "🐸", "🐝", "🦍", "🐟", "🐙", "🐯", "🦁", "🦃", "🦒", "🐧", "🐌", "🐘", "🐳"]
    
    private static func createMemoryGame(pairOfCards: Int) -> MemoryGame<String> {
        MemoryGame<String>(numPairOfCards: pairOfCards) { pairIndex in emojis[pairIndex] }
    }
    
    @Published private var model = createMemoryGame(pairOfCards: MemoryGameViewModel.tmp)
    
    var cards: Array<Card> {
        model.cards
    }
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func restart() {
        model = MemoryGameViewModel.createMemoryGame(pairOfCards: MemoryGameViewModel.tmp)
    }
}
