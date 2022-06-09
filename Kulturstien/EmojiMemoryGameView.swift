//
//  EmojiMemoryGameView.swift
//  Kulturstien
//
//  Created by Sigurd Graff Henrichsen on 23/05/2022.
//

//
//  EmojiMemoryGameView.swift
//  memory-card-matching-game
//
//  Created by Archie Liu on 2021-04-23.
//

/// Code adapted from [Archie Liu](https://github.com/archie-lhd/memory-card-matching-game)

import SwiftUI

func endGame(handler: ViewIndex, gameTheme: String, score: Int) -> String {
	
	if gameTheme == "Bondens redskaper" {
		if handler.farmMemoryGameScore < score {
			handler.farmMemoryGameScore = score
		}
	} else {
		if handler.fairtytaleMemoryGameScore < score {
			handler.fairtytaleMemoryGameScore = score
		}
	}
	handler.scorePlaceHolder = score
	handler.pageIndex = .memoryGameEnd
	return ""
}

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGameViewModel
	@EnvironmentObject var page : ViewIndex
    
    var body: some View {
        return VStack{
			Text("Poeng: \(viewModel.getScore())")
				.font(.subHeadlineFont)
            Grid(items: viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    withAnimation(.easeInOut(duration: 0.3)) {
                            viewModel.choose(card: card)
                        }
                    }
                    .padding(5)
            }
			.foregroundColor(Color(viewModel.theme.accentColor))
			.accentColor(Color(viewModel.theme.accentColor))
			if viewModel.gameDone() {
				Image(endGame(handler: page, gameTheme: viewModel.theme.name, score: viewModel.getScore()))
			}
    }
		.padding()
}

struct CardView: View {
    var card: MemoryGame<String>.Card
	@EnvironmentObject var page : ViewIndex
	
    var body: some View {
        GeometryReader { geometry in
            body(for: geometry.size)
        }
    }
    
    @State private var animatedBonusRemaining: Double = 0
    
    private func startBonusTimeAnimation() {
        animatedBonusRemaining = card.bonusRemaining
        withAnimation(.linear(duration: card.bonusTimeRemaining)) {
            animatedBonusRemaining = 0
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Group {
                    if card.isConsumingBonusTime {
                        Pie(
                            startAngle: Angle.degrees(0-90),
                            endAngle: Angle.degrees(-animatedBonusRemaining * 360 - 90),
                            clockwise: true
                        ).onAppear{
                            self.startBonusTimeAnimation()
                        }
                    } else {
                        Pie(
                            startAngle: Angle.degrees(0-90),
                            endAngle: Angle.degrees(-card.bonusRemaining * 360 - 90),
                            clockwise: true
                        )
                    }
                }.padding(5).opacity(0.25).transition(.identity)
				Image(card.content)
					.resizable()
					.scaledToFit()
					.rotationEffect(Angle.degrees(card.isMatched ? 360:0))
					.animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default)

            }
			.cardify(isFaceUp: card.isFaceUp, shadowColour: page.lightMode ? .gray : .white)
            .transition(.scale)
		}
    }
    // MARK: - drawing constants
    
    private func fontSize(for size: CGSize) -> CGFloat {
        return min(size.width, size.height) * 0.7
    }


}

}
/*
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGameViewModel(theme: DefaultThemes.theme1)
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game).environmentObject(ViewIndex())
    }
}

}*/
