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
	//@Binding var isPresented: Bool
	
    //var gameScene = SKScene(fileNamed: "GameScene")
	//var gameOverScene = SKScene(fileNamed: "GameOverScene")
	
	@StateObject var gameScene = GameScene(size: DeviceSize.size)
	//var gameView: SpriteView
	
	/*init(size: CGSize) {
		self.gameScene = GameScene(size: size)
		self.gameView = SpriteView(scene: gameScene)
	}*/
	
	
    var body: some View {
		
		if !gameScene.gameOverHuldra {
			SpriteView(scene: gameScene)
				.ignoresSafeArea()
		} else {
			
			Image("")
				.onAppear {
					page.scorePlaceHolder = gameScene.monstersDestroyed
					page.pageIndex = .gameEnd
					//isPresented.toggle()
				}
			
			//HuldraGameOverView(score: gameScene.monstersDestroyed)
		}
		
		/*ZStack {
			if !gameScene.gameOverHuldra {
				SpriteView(scene: gameScene)
					.ignoresSafeArea()
			} else {
				HuldraGameOverView(score: gameScene.monstersDestroyed)
			}
		}*/
    }
}

/*struct Test: UIViewRepresentable {
	func makeUIView(context: Context) -> SKView {
		
		@EnvironmentObject var page : ViewIndex
		
		let sceneView = SKView()
		let gameScene = GameScene(size: DeviceSize.size)
		
		scene.controller = self
				skView.ignoresSiblingOrder = true
				scene.scaleMode = .AspectFill
				skView.presentScene(scene)
		
		var scene: SKScene {
			let scene = Level_1()
				scene.size = GameScene(size: DeviceSize.size)
				return scene
			}
		
		if !gameScene.gameOverHuldra {
			SpriteView(scene: gameScene)
		} else {
			Image("")
				.onAppear {
					page.scorePlaceHolder = gameScene.monstersDestroyed
					page.pageIndex = .gameEnd
				}
			
			//HuldraGameOverView(score: gameScene.monstersDestroyed)
		}
		return sceneView
	}
	func updateUIView(_ uiView: SKView, context: Context) {
	}
}*/

struct HuldraGameOverView: View {
	
	@EnvironmentObject var page : ViewIndex
	var score: Int
	
	var body: some View {
		ZStack {
		Color("CreatureInformationBackground")
			VStack {
				Text("Poeng: " + String(score))
					.foregroundColor(page.lightMode ? .black : .white)
				Button(action: {
					if gameSelection == .frightenHuldra {
						if page.user.frightenHuldraGameScore < score {
							page.user.frightenHuldraGameScore = score
						}
					} else if gameSelection == .wackANokk {
						if page.user.wackANokkGameScore < score {
							page.user.wackANokkGameScore = score
						}
					}
					page.pageIndex = getPageByGameSelection(game: gameSelection)
				}) {
					Text("Spill på nytt")
						.frame(width: DeviceSize.width * 0.5)
						.foregroundColor(page.lightMode ? .black : .white)
						.padding(20)
						.background(
							RoundedRectangle(cornerRadius: 15).fill(page.lightMode ? Color(red: 0.984, green: 0.984, blue: 0.984) : Color("CreatureInformationTextboxBackground"))
								.shadow(color: .gray.opacity(0.5), radius: 4, x: 0, y: 4))
				}.padding(.bottom)
				
				Button(action: {
					if gameSelection == .frightenHuldra {
						if page.user.frightenHuldraGameScore < score {
							page.user.frightenHuldraGameScore = score
						}
					} else if gameSelection == .wackANokk {
						if page.user.wackANokkGameScore < score {
							page.user.wackANokkGameScore = score
						}
					}
					if page.lightMode {
						page.pageIndex = .main
					} else {
						page.pageIndex = .mainNight
					}
				}) {
					Text("Gå tilbake til kartet")
						.frame(width: DeviceSize.width * 0.5)
						.padding(20)
						.foregroundColor(page.lightMode ? .black : .white)
						/*.overlay(RoundedRectangle(cornerRadius: 15)
							.stroke(Color.gray, lineWidth: 1)
						)
						.background(RoundedRectangle(cornerRadius: 15)
							.fill(.white)
						)*/
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
