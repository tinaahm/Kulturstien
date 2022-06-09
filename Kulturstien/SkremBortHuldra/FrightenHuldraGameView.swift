//
//  FrightenHuldraGameView.swift
//  Kulturstien
//
//  Created by Lucas on 02/06/2022.
//

import SwiftUI
import SpriteKit

import UIKit

struct FrightenHuldraGameView: View {
	
	@EnvironmentObject var page : ViewIndex
	@StateObject var gameScene = GameScene(size: DeviceSize.size)
	@State var paused: Bool = false
	
    var body: some View {
		
		ZStack {
			if !gameScene.gameOverHuldra {
				SpriteView(scene: gameScene)
					.ignoresSafeArea()
				
				if self.paused {
					Color.gray.opacity(0.8)
						.edgesIgnoringSafeArea(.all)
					ZStack {
						VStack {
							Button (action: {
								page.pageIndex = .resetView
							}) {
								Label("Start på nytt", systemImage: "arrow.clockwise")
									.font(.textFont)
									.foregroundColor(page.lightMode ? .black : .black)
									.frame(width: DeviceSize.width * 0.5)
									.padding(20)
									.background(
										RoundedRectangle(cornerRadius: 15).fill(.white))
							}
							Button (action: {
								if page.lightMode {
									page.pageIndex = .main
								} else {
									page.pageIndex = .mainNight
								}
							}) {
								Label("Tilbake til kartet", systemImage: "")
									.font(.textFont)
									.foregroundColor(page.lightMode ? .black : .black)
									.frame(width: DeviceSize.width * 0.5)
									.padding(20)
									.background(
										RoundedRectangle(cornerRadius: 15).fill(.white))
							}
						}
						
						
					}
				}
				
				
			} else if gameScene.gameOverHuldra {
				
				Image("")
					.onAppear {
						page.scorePlaceHolder = gameScene.monstersDestroyed
						page.pageIndex = .gameEnd
					}
			}
			
			VStack {
				HStack {
					Button (action: {
						if self.paused {
							gameScene.isPaused = false
						} else {
							gameScene.isPaused = true
						}
						self.paused.toggle()
					}) {
						Image(systemName: "playpause.fill")
							.foregroundColor(page.lightMode ? .black : .white)
							.padding()
					}
					.padding(.leading, 25)
					Spacer()
				}
				Spacer()
			}
			
		}
    }
}

struct HuldraGameOverView: View {
	
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

struct FrightenHuldraGameView_Previews: PreviewProvider {
    static var previews: some View {
		FrightenHuldraGameView().environmentObject(ViewIndex())
    }
}

struct HuldraGameOverView_Previews: PreviewProvider {
	static var previews: some View {
		HuldraGameOverView(score: 0).environmentObject(ViewIndex())
	}
}
