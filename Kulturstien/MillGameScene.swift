//
//  MillGameScene.swift
//  Kulturstien
//
//  Created by Embla on 01/06/2022.
//

import SpriteKit
import SwiftUI
import GameplayKit

class MillGameScene: SKScene {
    
    override func update(_ currentTime: TimeInterval) {
    }
    
    override func didMove(to view: SKView) {
        physicsWorld.gravity = CGVector(dx: 0, dy: -15)
        
        _ = Timer.scheduledTimer(timeInterval: 0.7, target: self, selector: #selector(addPlank), userInfo: nil, repeats: true)
        
        }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let box = SKSpriteNode(color: .red, size: CGSize(width: 50, height: 50))
        box.position = location
        box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 50))
        addChild(box)
    }
    
    func generateAssets() {

        
    }
    
    @objc func addPlank() {
        
        let randomAssetNum = GKRandomDistribution(lowestValue: 0, highestValue: 1)
        
        var asset: SKSpriteNode
        
        if (randomAssetNum.nextInt() == 0) {
            asset = SKSpriteNode(imageNamed: "nail")
            asset.size = CGSize(width: 14, height: 80)
        }
        else {
            asset = SKSpriteNode(imageNamed: "nice-plank")
            asset.size = CGSize(width: 68, height: 32)
        }
        
        let random = GKRandomDistribution(lowestValue: 0, highestValue: Int(self.frame.size.width))
        
        let randomRadian = GKRandomDistribution(lowestValue: 0, highestValue: 7)
        
        asset.position = CGPoint(x: CGFloat(random.nextInt()), y: self.frame.size.height)
        
        asset.zRotation = CGFloat(randomRadian.nextInt())
        
        asset.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 68, height: 32))
        
        self.addChild(asset)
    }
    
}
