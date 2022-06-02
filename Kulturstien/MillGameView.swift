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
        let screenSize: CGRect = UIScreen.main.bounds
        
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        let scene = MillGameScene()
        
        scene.size = CGSize(width: screenWidth, height: screenHeight)
        scene.scaleMode = .fill
        
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
            .previewInterfaceOrientation(.portrait)
    }
}
