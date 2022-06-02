//
//  MillGameScene.swift
//  Kulturstien
//
//  Created by admin on 01/06/2022.
//

import SpriteKit

class MillGameScene: SKScene {
    /*override func didMove(to view: SKView) {
        
        print("You are in the scene!")
        
        let label = SKLabelNode()
        label.text = "Hello World!"
        label.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        label.fontSize = 30
        label.fontColor = SKColor.red
        self.addChild(label)
        
     
     }
    */
    
    var basket = SKSpriteNode()
    
    override func update(_ currentTime: TimeInterval) {
        backgroundColor = .black
    }
    
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
        // PLANK SPRITE
        let plank = SKSpriteNode(imageNamed: "nice-plank")
        plank.size = CGSize(width: 32, height: 32)
        plank.anchorPoint = CGPoint(x: 50, y: 1)
    
        plank.position = CGPoint(x: 50, y: 100)
        plank.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 32, height: 32))
        
        addChild(plank)
        }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let box = SKSpriteNode(color: .red, size: CGSize(width: 50, height: 50))
        box.position = location
        box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 50))
        addChild(box)
    }
}
