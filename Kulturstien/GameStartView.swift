//
//  GameStartView.swift
//  Kulturstien
//
//  Created by Tina on 03/06/2022.
//

import SwiftUI

/// View that shows before game start.
struct GameStartView: View {
	
	@EnvironmentObject var page : ViewIndex
	@State var show = false
	
    var body: some View {
		ZStack {
			Color(page.lightMode ? "BackgroundColour" : "CreatureInformationBackground")
			if !(gameSelection == .whacANokk) {
				VStack {
					BackButtonView(buttonColour: page.lightMode ? .black : .white)
					if !(gameSelection == .millGame) {
						Image(page.lightMode ? "cardGames" : "Bonfire")
							.resizable()
							.frame(width: 100, height: 100, alignment: .center)
							.padding()
					}
					VStack {
						Text(gameSelection.rawValue)
							.font(.headlineFont)
							.multilineTextAlignment(.center)
							.foregroundColor(page.lightMode ? .black : .white)
							.padding(.bottom, 5)
						Text(getGameExplainationByGame(selection: gameSelection))
							.font(.subHeadlineFont)
							.foregroundColor(page.lightMode ? .black : .white)
							.multilineTextAlignment(.center)
					}
					.padding([.top, .leading, .trailing])
					.padding(.bottom, 30)
					
					Button(action: {
						page.previousPage = page.pageIndex
						page.pageIndex = getPageByGameSelection(game: gameSelection)
					}) {
						Text("Start spill")
							.font(.textFont)
							.foregroundColor(page.lightMode ? .black : .white)
							.frame(width: DeviceSize.width * 0.5)
							.padding(20)
							.background(
								RoundedRectangle(cornerRadius: 15).fill(page.lightMode ? Color(red: 0.984, green: 0.984, blue: 0.984) : Color("CreatureInformationTextboxBackground"))
									.shadow(color: .gray.opacity(0.25), radius: 4, x: 0, y: 4))
					}
					.padding()
					Spacer()
				}
			} else {
				ZStack {
					VStack(spacing: 40) {
						BackButtonView(buttonColour: page.lightMode ? .black : .white)
						Spacer()
							Text(getGameExplainationByGame(selection: .whacANokk))
								.font(.subHeadlineFont)
								.foregroundColor(page.lightMode ? .black : .white)
								.multilineTextAlignment(.center)
								.padding()
						
						Button(action: {
							page.previousPage = page.pageIndex
							page.pageIndex = getPageByGameSelection(game: gameSelection)
						}) {
							Text("Start spill")
								.font(.textFont)
								.foregroundColor(page.lightMode ? .black : .white)
								.frame(width: DeviceSize.width * 0.5)
								.padding(20)
								.background(
									RoundedRectangle(cornerRadius: 15).fill( Color("LightGreen"))
										.shadow(color: .black.opacity(0.5), radius: 4, x: 0, y: 4))
						}
						.padding()
						Image("Bonfire")
							.resizable()
							.frame(width: 100, height: 100, alignment: .center)
							.padding()
						Spacer()
					}
				}
				.background(
					Image("WhacANokkBackground")
					.resizable()
					.edgesIgnoringSafeArea(.all)
				)
			}
		}
		.background(Color(page.lightMode ? "BackgroundColour" : "CreatureInformationBackground"))
    }

	/// Get the explaination for the game.
	///
	/// - Parameters:
	/// 	- selection:  The currently selected game.
	///
	/// - Returns: The game explaination.
	func getGameExplainationByGame(selection: Game) -> String {
		switch selection {
		case .whacANokk:
			return "Slå nøkken og unngå dyrene!"
		case .frightenHuldra:
			return "Hjelp Trond å jage Huldra!"
		case .farmMemoryGame:
			return "Samle opp alle redskapene på gården ved å finne de like kortene."
		case .fairytaleCreaturesMemoryGame:
			return "Fang alle de underjoridske vesnene ved å finne de like kortene."
		case .millGame:
			return "Fang alle delene i elva for å reparere mølla!\nUnngå å fange rusk, da må du starte på nytt."
		case .none:
			return ""
		}
	}
}

/*
struct GameStartView_Previews: PreviewProvider {
    static var previews: some View {
        GameStartView().environmentObject(ViewIndex())
    }
}*/
