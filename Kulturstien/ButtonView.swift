//
//  ButtonView.swift
//  Kulturstien
//
//  Created by Tina on 20/05/2022.
//

import SwiftUI

enum Game {
	case wackANokk
	case frightenHuldra
	case farmMemoryGame
	case fairytaleCreaturesMemoryGame
	case none
}

struct ButtonView: View {
	
	@EnvironmentObject var page : ViewIndex
	
	var selectedStructure: Structure = .none
	var selectedPerson: Person = .none
	var selectedGame: Game = .none
	var selectedCreature: Person = .none
	var image: String
	var width: CGFloat
	var height: CGFloat
	var posX: CGFloat
	var posY: CGFloat
	
	var body: some View {
		Button (action: {
			if selectedStructure != .none {
				page.previousPage = page.pageIndex
				informationSelection = selectedStructure
				page.pageIndex = .selection
			} else if selectedPerson != .none {
				page.previousPage = page.pageIndex
				personSelection = selectedPerson
				page.pageIndex = .personInformation
			} else if selectedGame != .none {
				page.previousPage = page.pageIndex
				page.pageIndex = getPageByGameSelection(game: selectedGame)
			} else if selectedCreature != .none {
				page.previousPage = page.pageIndex
				personSelection = selectedCreature
				page.pageIndex = .creatureInformation
			}
		}) {
			Image(image)
				.resizable()
				.frame(width: width, height: height)
				.padding(15)
                .padding(.bottom, 100)

		}
		.position(x: posX, y: posY)
	}
}

func getPageByGameSelection(game: Game) -> Page {
	switch game {
	case .wackANokk:
		return .wackANokk
	case .frightenHuldra:
		return .huldraGame
	case .farmMemoryGame:
		return .farmMemoryGame
	case .fairytaleCreaturesMemoryGame:
		return .fairytaleCreaturesMemoryGame
	case .none:
		return .main
	}
}

/*struct ButtonView_Previews: PreviewProvider {
	static var previews: some View {
		ButtonView(selectionType: .none, image: "", width: 0, height: 0, posX: 0, posY: 0).environmentObject(ViewIndex())
	}
}*/
