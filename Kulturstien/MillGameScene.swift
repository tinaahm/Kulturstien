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
    
    let nailTexture: SKTexture = SKTexture(imageNamed: "nail")
    let netTexture: SKTexture = SKTexture(imageNamed: "net")
    let plankTexture: SKTexture = SKTexture(imageNamed: "nice-plank")
    
    override func update(_ currentTime: TimeInterval) {}
    
    override func didMove(to view: SKView) {
        self.size = view.frame.size
        
        backgroundColor = UIColor.systemMint
        physicsWorld.gravity = CGVector(dx: 0, dy: -15)
        
        let playerSprite: SKSpriteNode = SKSpriteNode(texture: netTexture)
        playerSprite.size = CGSize(width: 100, height: 85)
        playerSprite.anchorPoint = CGPoint(x: -1.5, y: -1)
        playerSprite.position = CGPoint(x: 0, y: 0)
        
        self.addChild(playerSprite)
    
        //playerSprite.drawBorder(color: UIColor.red, width: 6)
        
        Timer.scheduledTimer(timeInterval: 0.7, target: self, selector: #selector(generateRandomAsset), userInfo: nil, repeats: true)
        }
    
    @objc func generateRandomAsset() {
        
        let randomAssetNum = GKRandomDistribution(lowestValue: 0, highestValue: 1)
        
        var asset: SKSpriteNode
        
        if (randomAssetNum.nextInt() == 0) {
            asset = SKSpriteNode(texture: nailTexture)
            asset.size = CGSize(width: 14, height: 80)
        }
        else {
            asset = SKSpriteNode(texture: plankTexture)
            asset.size = CGSize(width: 68, height: 32)
        }
        
        let randomPosition = GKRandomDistribution(lowestValue: 0, highestValue: Int(self.frame.size.width))
        
        let randomRadian = GKRandomDistribution(lowestValue: 0, highestValue: 7)
        
        asset.position = CGPoint(x: CGFloat(randomPosition.nextInt()), y: self.frame.size.height)
        
        asset.zRotation = CGFloat(randomRadian.nextInt())
        
        asset.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: asset.size.width, height: asset.size.height))
        
        self.addChild(asset)
    }
    
}

extension SKSpriteNode {
    func drawBorder(color: UIColor, width: CGFloat) {
        let shapeNode = SKShapeNode(rect: frame)
        shapeNode.fillColor = .clear
        shapeNode.strokeColor = color
        shapeNode.lineWidth = width
        addChild(shapeNode)
    }
}
