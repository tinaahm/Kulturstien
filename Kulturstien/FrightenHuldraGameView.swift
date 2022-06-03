//
//  FrightenHuldraGameView.swift
//  Kulturstien
//
//  Created by Lucas on 02/06/2022.
//

import SwiftUI
import SceneKit
import SpriteKit

import UIKit

struct FrightenHuldraGameView: View {
	
	@EnvironmentObject var page : ViewIndex
	
    var gameScene = SKScene(fileNamed: "GameScene")
	var gameOverScene = SKScene(fileNamed: "GameOverScene")
	
    
    var body: some View {
		ZStack {
			//if !page.frigtenHuldraGameOver {
				SpriteView(scene: gameScene!)
					.ignoresSafeArea()
			/*} else {
				SpriteView(scene: gameScene!)
					.ignoresSafeArea()
			}
			*/
			VStack {
				BackButtonView()
				Spacer()
			}
		}
    }
}

struct FrightenHuldraGameView_Previews: PreviewProvider {
    static var previews: some View {
        FrightenHuldraGameView().environmentObject(ViewIndex())
    }
}
