//
//  GameEndView.swift
//  Kulturstien
//
//  Created by Tina on 02/06/2022.
//

import SwiftUI

/// View that appears once the game has ended.
struct MemoryGameEndView: View {
	
	@EnvironmentObject var page : ViewIndex
	
	@State var gameType: Game
	init(gameType: Game) {
		self.gameType = gameType
	}
	
    var body: some View {
		
		let score = page.scorePlaceHolder
		
		ZStack {
			Color(page.lightMode ? "BackgroundColour" : "CreatureInformationBackground")
			VStack {
				Text("Game Over")
					.font(.headlineFont)
					.padding()
					.foregroundColor(page.lightMode ? .black : .white)
				Text("Poeng: " + String(score))
					.font(.subHeadlineFont)
					.foregroundColor(page.lightMode ? .black : .white)
				Button(action: {
					page.pageIndex = getPageByGameSelection(game: gameSelection)
				}) {
					Text("Spill på nytt")
						.font(.textFont)
						.foregroundColor(page.lightMode ? .black : .white)
						.frame(width: DeviceSize.width * 0.5)
						.padding(20)
						.background(
							RoundedRectangle(cornerRadius: 15).fill(page.lightMode ? Color(red: 0.984, green: 0.984, blue: 0.984) : Color("CreatureInformationTextboxBackground"))
								.shadow(color: .gray.opacity(0.25), radius: 4, x: 0, y: 4))
				}
				.padding()
				
				Button(action: {
					if page.lightMode {
						page.pageIndex = .main
					} else {
						page.pageIndex = .mainNight
					}
				}) {
					Text("Gå tilbake til kartet")
						.font(.textFont)
						.foregroundColor(page.lightMode ? .black : .white)
						.frame(width: DeviceSize.width * 0.5)
						.padding(20)
						.background(
							RoundedRectangle(cornerRadius: 15).fill(page.lightMode ? Color(red: 0.984, green: 0.984, blue: 0.984) : Color("CreatureInformationTextboxBackground"))
								.shadow(color: .gray.opacity(0.25), radius: 4, x: 0, y: 4))
				}
				.padding(.bottom)
			}
		}
		.background(Color(page.lightMode ? "BackgroundColour" : "CreatureInformationBackground"))
    }
}

/// View which appears when the non-memory games are over.
struct MainGamesOverView: View {
	
	@EnvironmentObject var page : ViewIndex
	var score: Int
	
	var body: some View {
		ZStack {
			Color(page.lightMode ? "BackgroundColour" : "CreatureInformationBackground")
			VStack {
				Text("Poeng: " + String(score))
					.foregroundColor(page.lightMode ? .black : .white)
				Button(action: {
					if gameSelection == .frightenHuldra {
						if page.frightenHuldraGameScore < score {
							page.frightenHuldraGameScore = score
						}
					} else if gameSelection == .whacANokk {
						if page.wackANokkGameScore < score {
							page.wackANokkGameScore = score
						}
					} else if gameSelection == .millGame {
						if page.millGameScore < score {
							page.millGameScore = score
						}
					}
					page.pageIndex = getPageByGameSelection(game: gameSelection)
				}) {
					Text("Spill på nytt")
						.font(.textFont)
						.frame(width: DeviceSize.width * 0.5)
						.foregroundColor(page.lightMode ? .black : .white)
						.padding(20)
						.background(
							RoundedRectangle(cornerRadius: 15).fill(page.lightMode ? Color(red: 0.984, green: 0.984, blue: 0.984) : Color("CreatureInformationTextboxBackground"))
								.shadow(color: .gray.opacity(0.5), radius: 4, x: 0, y: 4))
				}.padding(.bottom)
				
				Button(action: {
					if gameSelection == .frightenHuldra {
						if page.frightenHuldraGameScore < score {
							page.frightenHuldraGameScore = score
						}
					} else if gameSelection == .whacANokk {
						if page.wackANokkGameScore < score {
							page.wackANokkGameScore = score
						}
					} else if gameSelection == .millGame {
						if page.millGameScore < score {
							page.millGameScore = score
						}
					}
					if page.lightMode {
						page.pageIndex = .main
					} else {
						page.pageIndex = .mainNight
					}
				}) {
					Text("Gå tilbake til kartet")
						.font(.textFont)
						.frame(width: DeviceSize.width * 0.5)
						.padding(20)
						.foregroundColor(page.lightMode ? .black : .white)
						.background(
							RoundedRectangle(cornerRadius: 15).fill(page.lightMode ? Color(red: 0.984, green: 0.984, blue: 0.984) : Color("CreatureInformationTextboxBackground"))
								.shadow(color: .gray.opacity(0.5), radius: 4, x: 0, y: 4))
				}
				.padding(.bottom)
			}
		}
		.background(Color(page.lightMode ? "BackgroundColour" : "CreatureInformationBackground"))
	}
}

/*
struct GameEndView_Previews: PreviewProvider {
    static var previews: some View {
		GameEndView(gameType: .none).environmentObject(ViewIndex())
    }
}*/
