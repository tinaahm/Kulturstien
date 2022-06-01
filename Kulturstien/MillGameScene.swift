//
//  MillGameScene.swift
//  Kulturstien
//
//  Created by admin on 01/06/2022.
//

import SpriteKit

class MillGameScene: SKScene {
    override func didMove(to view: SKView) {
        
        print("You are in the scene!")
        
        let label = SKLabelNode()
        label.text = "Hello World!"
        label.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        label.fontSize = 30
        label.fontColor = SKColor.red
        self.addChild(label)
        
     
     }
    
    override func update(_ currentTime: TimeInterval) { }
}
