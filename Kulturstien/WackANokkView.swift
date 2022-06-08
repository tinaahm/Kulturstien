//
//  WackANokkView.swift
//  Kulturstien
//
//  Created by Tina on 24/05/2022.
//

import SwiftUI
import SceneKit
import SpriteKit

import UIKit

struct WackANokkView: View {
	
	@EnvironmentObject var page : ViewIndex
	@StateObject var gameScene = WackGameScene(size: DeviceSize.size)
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
									.font(.subHeadlineFont)
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
									.font(.subHeadlineFont)
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
						page.scorePlaceHolder = gameScene.score
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

struct WackANokkView_Previews: PreviewProvider {
	static var previews: some View {
		WackANokkView().environmentObject(ViewIndex())
	}
}
