//
//  MillGameScene.swift
//  Kulturstien
//
//  Created by admin on 01/06/2022.
//

import SpriteKit
import SwiftUI
import GameplayKit

class MillGameScene: SKScene {
    
    var basket = SKSpriteNode()
    
    let container = SKSpriteNode()
    let plank = SKSpriteNode(imageNamed: "nice-plank")
    
    override func update(_ currentTime: TimeInterval) {
    }
    
    override func didMove(to view: SKView) {
        physicsWorld.gravity = CGVector(dx: 0, dy: -10)

        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        plank.size = CGSize(width: 68, height: 33)
    
        plank.position = CGPoint(x: screenWidth / 2, y: screenHeight)
        plank.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 68, height: 32))
        
        self.addChild(plank)
        
        _ = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(addPlank), userInfo: nil, repeats: true)
        
        }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let box = SKSpriteNode(color: .red, size: CGSize(width: 50, height: 50))
        box.position = location
        box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 50))
        addChild(box)
    }
    
    @objc func addPlank(){
        let plank = SKSpriteNode(imageNamed: "nice-plank")
        
        let random = GKRandomDistribution(lowestValue: 0, highestValue: Int(self.frame.size.width))
        
        let randomRadian = GKRandomDistribution(lowestValue: 0, highestValue: 7)
                
        plank.size = CGSize(width: 68, height: 32)
        
        plank.position = CGPoint(x: CGFloat(random.nextInt()), y: self.frame.size.height)
        
        plank.zRotation = CGFloat(randomRadian.nextInt())
        
        plank.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 68, height: 32))
        
        self.addChild(plank)
    }
}
