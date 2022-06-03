//
//  MillGameScene.swift
//  Kulturstien
//
//  Created by Embla on 01/06/2022.
//

import SpriteKit
import SwiftUI
import GameplayKit

class MillGameScene: SKScene, SKPhysicsContactDelegate {
    
    let nailTexture = SKTexture(imageNamed: "nail")
    let plankTexture = SKTexture(imageNamed: "nice-plank")
    let paperTexture = SKTexture(imageNamed: "paper-brown")
    
    let playerSprite: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "net"))
    
    override func update(_ currentTime: TimeInterval) {}
    
    override func didMove(to view: SKView) {
        backgroundColor = UIColor.init(Color("WaterColor"))
        self.size = view.frame.size
        
        self.physicsWorld.contactDelegate = self
        physicsWorld.gravity = CGVector(dx: 0, dy: -30)
        
        makePlayer()
        
        /*
         Collision
         */
        
        // playerSprite.physicsBody?.categoryBitMask
        
        /*
         Collision End
         */
    
        Timer.scheduledTimer(timeInterval: 0.7, target: self, selector: #selector(generateRandomAsset), userInfo: nil, repeats: true)
        }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {}
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let coords = touch.location(in: self)
            
            playerSprite.position.x = coords.x - 185
        }
        
        print("player x: \(playerSprite.position.x), player y: \(playerSprite.position.y)")
    }
    
    func makePlayer() {
        playerSprite.size = CGSize(width: 100, height: 85)
        playerSprite.anchorPoint = CGPoint(x: -1.5, y: -1)
        playerSprite.position = CGPoint(x: 0, y: 0)
        
        playerSprite.physicsBody = SKPhysicsBody(rectangleOf: playerSprite.size)
        playerSprite.physicsBody?.affectedByGravity = false
        playerSprite.physicsBody?.isDynamic = false;
        
        playerSprite.name = "player"
        
        self.addChild(playerSprite)
    }
    
    @objc func generateRandomAsset() {
        
        let randomAssetNum = GKRandomDistribution(lowestValue: 0, highestValue: 4)
        
        var asset: SKSpriteNode
        
        let currentAsset = randomAssetNum.nextInt()
        
        if (currentAsset == 0) {
            asset = SKSpriteNode(texture: nailTexture)
            asset.size = CGSize(width: 14, height: 80)
        }
        else if (currentAsset == 1) {
            asset = SKSpriteNode(texture: plankTexture)
            asset.size = CGSize(width: 68, height: 32)
        }
        else {
            asset = SKSpriteNode(texture: paperTexture)
            asset.size = CGSize(width: 60, height: 60)
        }
        
        let randomPosition = GKRandomDistribution(lowestValue: 0, highestValue: Int(self.frame.size.width))
        
        let randomRadian = GKRandomDistribution(lowestValue: 0, highestValue: 7)
        
        asset.position = CGPoint(x: CGFloat(randomPosition.nextInt()), y: self.frame.size.height)
        
        asset.zRotation = CGFloat(randomRadian.nextInt())
        
        asset.physicsBody = SKPhysicsBody(rectangleOf: asset.size)
        
        self.addChild(asset)
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let first = SKPhysicsBody()
        _ = SKPhysicsBody()
        
        if (first.node?.name == "player") {
            first.affectedByGravity = true
            print("We have contact!")
        }
    }
}

// COPIED FROM STACKOVERFLOW - DELETE
extension SKSpriteNode {
    func drawBorder(color: UIColor, width: CGFloat) {
        let shapeNode = SKShapeNode(rect: frame)
        shapeNode.fillColor = .clear
        shapeNode.strokeColor = color
        shapeNode.lineWidth = width
        addChild(shapeNode)
    }
}
