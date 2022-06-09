//
//  GameStartView.swift
//  Kulturstien
//
//  Created by Tina on 03/06/2022.
//

import SwiftUI

struct GameStartView: View {
	
	@EnvironmentObject var page : ViewIndex
	@State var show = false
	
    var body: some View {
		ZStack {
			Color(page.lightMode ? "BackgroundColour" : "CreatureInformationBackground")
			VStack {
				BackButtonView(buttonColour: page.lightMode ? .black : .white)
				Image(page.lightMode ? "cardGames" : "bonfire 3")
					.resizable()
					.frame(width: 100, height: 100, alignment: .center)
					.padding()
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
		}
		.background(Color(page.lightMode ? "BackgroundColour" : "CreatureInformationBackground"))
    }
}

func getGameExplainationByGame(selection: Game) -> String {
	switch selection {
	case .whacANokk:
		return "Slå nøkken og unngå dyrene!"
	case .frightenHuldra:
		return "Hjelp Trond å jage vekk Huldra!"
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

struct GameStartView_Previews: PreviewProvider {
    static var previews: some View {
        GameStartView().environmentObject(ViewIndex())
    }
}
