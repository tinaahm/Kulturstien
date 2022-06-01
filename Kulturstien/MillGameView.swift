//
//  MillGameView.swift
//  Kulturstien
//
//  Created by Tina on 31/05/2022.
//

import SpriteKit
import SwiftUI

struct MillGameView: View {
    
    var gameScene: SKScene {
        let scene = Kulturstien.GameScene()
        scene.size = CGSize(width: 216, height: 216)
        scene.scaleMode = .fill
        
        return scene
    }
    
    var body: some View {
        SpriteView(scene: self.gameScene).frame(width: 256, height: 256)
            .ignoresSafeArea()
    }
}

struct MillGameView_Previews: PreviewProvider {
    static var previews: some View {
		MillGameView()
    }
}
