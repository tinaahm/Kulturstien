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
    var theScene = SKScene(fileNamed: "GameScene")
	
    
    var body: some View {
		ZStack {
			SpriteView(scene: theScene!)
				.ignoresSafeArea()
			VStack {
				BackButtonView()
				Spacer()
			}
		}
    }
}

struct FrightenHuldraGameView_Previews: PreviewProvider {
    static var previews: some View {
        FrightenHuldraGameView()
    }
}
