//
//  EmojiMemoryGameViewModel.swift
//  Kulturstien
//
//  Created by Sigurd Graff Henrichsen on 23/05/2022.
//

//
//  EmojiMemoryGame.swift
//  memory-card-matching-game
//
//  Created by Archie Liu on 2021-04-24.
//

import SwiftUI

// An Example of ViewModel
class EmojiMemoryGameViewModel: ObservableObject {
	
	@EnvironmentObject var page : ViewIndex
	
    @Published private var model: MemoryGame<String>
    var theme: ThemeCollection.Theme
    init(theme: ThemeCollection.Theme) {
        self.theme = theme
        model = EmojiMemoryGameViewModel.createMemoryGame(theme: theme)
    }
    
    private static func createMemoryGame(theme: ThemeCollection.Theme) -> MemoryGame<String> {
        //return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 2...theme.emojiSet.count)) { pairIndex in
		return MemoryGame<String>(numberOfPairsOfCards: theme.emojiSet.count, themeName: theme.name) { pairIndex in
            return theme.emojiSet[pairIndex]
        }
    }

    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent
    
    func choose(card: MemoryGame<String>.Card) {
        // objectWillChange.send()
        model.choose(card: card);
    }
    
    // MARK: - Reset the game by changing the model to a new one
    func resetGame(){//-> EmojiMemoryGameViewModel {
        model = EmojiMemoryGameViewModel.createMemoryGame(theme: theme)
        //return self
    }
    
    func getScore() -> Int {
        return model.getScore()
    }
	
	func gameDone() -> Bool {
		return model.gameOver
	}
	
}
