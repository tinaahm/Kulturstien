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
	
	var theWackScene: SKScene {
		let theWackScene = WackGameScene()
		theWackScene.size = CGSize(width: 400, height: 800)
		theWackScene.scaleMode = .aspectFit
		theWackScene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
		return theWackScene
	}
    
	//var theWackScene = SKScene(fileNamed: "WackGameScene")
	
	var body: some View {
		ZStack {
			SpriteView(scene: self.theWackScene)
				.ignoresSafeArea()
				//.padding(.all)
				//.frame(width: 500, height: 800)
		}
	}
	
}

struct WackANokkView_Previews: PreviewProvider {
	static var previews: some View {
		WackANokkView()
	}
}
