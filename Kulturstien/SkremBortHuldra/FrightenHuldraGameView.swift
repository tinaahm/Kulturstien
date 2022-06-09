//
//  FrightenHuldraGameView.swift
//  Kulturstien
//
//  Created by Lucas on 02/06/2022.
//

import SwiftUI
import SpriteKit

import UIKit

/// View for showing the Whac-A-Nokk game.
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

/*struct FrightenHuldraGameView_Previews: PreviewProvider {
    static var previews: some View {
		FrightenHuldraGameView().environmentObject(ViewIndex())
    }
}*/
