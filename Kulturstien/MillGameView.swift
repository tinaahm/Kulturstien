//
//  MillGameView.swift
//  Kulturstien
//
//  Created by Tina on 31/05/2022.
//

import UIKit
import SpriteKit
import SwiftUI

struct MillGameView: View {
	
	@EnvironmentObject var page : ViewIndex
	@StateObject var gameScene = MillGameScene(size: DeviceSize.size)
	@State var paused: Bool = false
	
    var body: some View {
		
		ZStack {
			if !gameScene.gameOver {
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
				
			} else {
				Image("")
					.onAppear {
						page.scorePlaceHolder = gameScene.partsCounter
						page.pageIndex = .gameEnd
					}
			}
			
			VStack {
				HStack {
					Spacer()
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
					.padding(.trailing, 25)
				}
				Spacer()
			}
		}
    }
}

struct MillGameView_Previews: PreviewProvider {
    static var previews: some View {
		MillGameView().environmentObject(ViewIndex())
    }
}
