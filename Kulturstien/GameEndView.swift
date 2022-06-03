//
//  GameEndView.swift
//  Kulturstien
//
//  Created by Tina on 02/06/2022.
//

import SwiftUI

struct GameEndView: View {
	
	@EnvironmentObject var page : ViewIndex
	
	@State var gameType: Game
	init(gameType: Game) {
		self.gameType = gameType
	}
	
    var body: some View {
		
		let score = getGameSelectionFromPage(gameType: self.gameType, user: page.user)
		
		ZStack {
			Color("BackgroundColour")
			VStack {
				Text("Poeng: " + String(score))
				
				Button(action: {
					page.pageIndex = getPageByGameSelection(game: gameSelection)
				}) {
					Text("Spill på nytt")
						.frame(width: 150)
						.padding()
						.overlay(RoundedRectangle(cornerRadius: 15)
							.stroke(Color.gray, lineWidth: 1)
						)
						.background(RoundedRectangle(cornerRadius: 15)
							.fill(.white)
						)
						.foregroundColor(.black)
				}
				
				Button(action: {
					page.pageIndex = .main
				}) {
					Text("Gå tilbake til kartet")
						.frame(width: 150)
						.padding()
						.overlay(RoundedRectangle(cornerRadius: 15)
							.stroke(Color.gray, lineWidth: 1)
						)
						.background(RoundedRectangle(cornerRadius: 15)
							.fill(.white)
						)
						.foregroundColor(.black)
				}
			}
		}
		.background(Color("BackgroundColour"))
    }
	
}

func getGameSelectionFromPage(gameType: Game, user: User) -> Int {
	switch gameType {
	case .wackANokk:
		return user.wackANokkGameScore
	case .frightenHuldra:
		return user.frightenHuldraGameScore
	case .farmMemoryGame:
		return user.farmMemoryGameScore
	case .fairytaleCreaturesMemoryGame:
		return user.fairtytaleMemoryGameScore
	case .none:
		return 0
	}
}

struct GameEndView_Previews: PreviewProvider {
    static var previews: some View {
		GameEndView(gameType: .none).environmentObject(ViewIndex())
    }
}