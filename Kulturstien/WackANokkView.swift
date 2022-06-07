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
	
	var body: some View {
		
		if !gameScene.gameOver {
			SpriteView(scene: gameScene)
				.ignoresSafeArea()
		} else {
			Image("")
				.onAppear {
					page.scorePlaceHolder = gameScene.score
					page.pageIndex = .gameEnd
				}
		}
	}
	
}

struct WackANokkView_Previews: PreviewProvider {
	static var previews: some View {
		WackANokkView().environmentObject(ViewIndex())
	}
}
