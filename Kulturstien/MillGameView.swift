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
	
    /*public var gameScene: SKScene {
        let screenSize: CGRect = UIScreen.main.bounds
        
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        let scene = MillGameScene()
        
        scene.size = CGSize(width: screenWidth, height: screenHeight)
        scene.scaleMode = .fill
        
        return scene
    }*/
    
    var body: some View {
        ZStack {
			
			if !gameScene.gameOver {
				SpriteView(scene: gameScene, debugOptions: [
					.showsNodeCount, .showsFPS     // ,.showsPhysics
				])
					.ignoresSafeArea()
			} else {
				Image("")
					.onAppear {
						page.scorePlaceHolder = gameScene.partsCounter
						page.pageIndex = .gameEnd
					}
			}
            BackButtonView().position(x: 220, y: 40)
        }
    }
}

struct MillGameView_Previews: PreviewProvider {
    static var previews: some View {
		MillGameView().environmentObject(ViewIndex())
    }
}
