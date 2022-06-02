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
    
	var theWackScene = SKScene(fileNamed: "WackGameScene")
	
	var body: some View {
		SpriteView(scene: theWackScene!)
	}
	
}

struct WackANokkView_Previews: PreviewProvider {
	static var previews: some View {
		WackANokkView()
	}
}
