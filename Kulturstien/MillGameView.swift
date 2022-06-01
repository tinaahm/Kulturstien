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
    
    var gameScene: SKScene {
        //let view = self as SKView
        //let scene = SKScene(fileNamed: "MillGameScene")
        
        //scene!.scaleMode = .aspectFill
        //presentScene(scene)
        
        let scene = MillGameScene()
        
        scene.size = CGSize(width: 216, height: 216)
        scene.scaleMode = .aspectFit
        
        return scene
    }
    
    var body: some View {
        SpriteView(scene: self.gameScene)
            .ignoresSafeArea()
    }
}

struct MillGameView_Previews: PreviewProvider {
    static var previews: some View {
		MillGameView()
    }
}
