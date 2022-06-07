//
//  MillGameScene.swift
//  Kulturstien
//
//  Created by Embla on 01/06/2022.
//

import SpriteKit
import SwiftUI
import GameplayKit

struct Tag {
    static let trash: UInt32 = 0
    static let player: UInt32 = 1
    static let parts: UInt32 = 2
    static let other: UInt32 = 3
}

class MillGameScene: SKScene, SKPhysicsContactDelegate {
    
    let nailTexture = SKTexture(imageNamed: "nail")
    let plankTexture = SKTexture(imageNamed: "nice-plank")
    let paperTexture = SKTexture(imageNamed: "paper-brown")
    
    let playerSprite: SKSpriteNode =
        SKSpriteNode(texture: SKTexture(imageNamed: "net"))
    
    override func update(_ currentTime: TimeInterval) {}
    
    override func didMove(to view: SKView) {
        
        // START SHOW PHYSICS - DELETE
        let skView = self.view!
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.showsPhysics = true
        // END PHYSICS
        
        size = view.frame.size
        
        backgroundColor = UIColor.init(Color("WaterColor"))
        
        physicsWorld.contactDelegate = self
        physicsWorld.gravity = CGVector(dx: 0, dy: -5)
        
        makePlayer()
    
        Timer.scheduledTimer(timeInterval: 0.7, target: self, selector: #selector(generateRandomAsset), userInfo: nil, repeats: true)
        }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {}
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let coords = touch.location(in: self)
            
            playerSprite.position.x = coords.x - 185
        }
        
        print("player x-pos: \(playerSprite.position.x)")
    }
    
    func makePlayer() {
        playerSprite.size = CGSize(width: 100, height: 85)
        playerSprite.anchorPoint = CGPoint(x: -1.5, y: -1)
        playerSprite.position = CGPoint(x: 0, y: 0)
        
        playerSprite.physicsBody = SKPhysicsBody(rectangleOf: playerSprite.size)
        playerSprite.physicsBody?.affectedByGravity = true
        playerSprite.physicsBody?.isDynamic = false
        
        playerSprite.name = "player"
        
        playerSprite.physicsBody?.categoryBitMask = Tag.player
        playerSprite.physicsBody?.contactTestBitMask = Tag.other
        playerSprite.physicsBody?.collisionBitMask = Tag.trash
        
        self.addChild(playerSprite)
    }
    
    @objc func generateRandomAsset() {
    
        let randomAssetNum = GKRandomDistribution(lowestValue: 0, highestValue: 4)
        
        var asset: SKSpriteNode
        
        let currentAsset = randomAssetNum.nextInt()
        
        if (currentAsset == 0) {
            asset = SKSpriteNode(texture: nailTexture)
            asset.size = CGSize(width: 14, height: 80)
            
            asset.physicsBody = SKPhysicsBody(rectangleOf: asset.size)
            asset.physicsBody?.categoryBitMask = Tag.parts
        }
        else if (currentAsset == 1) {
            asset = SKSpriteNode(texture: plankTexture)
            asset.size = CGSize(width: 68, height: 32)
            
            asset.physicsBody = SKPhysicsBody(rectangleOf: asset.size)
            asset.physicsBody?.categoryBitMask = Tag.parts
        }
        else {
            asset = SKSpriteNode(texture: paperTexture)
            asset.size = CGSize(width: 60, height: 60)
            
            asset.physicsBody = SKPhysicsBody(rectangleOf: asset.size)
            asset.physicsBody?.categoryBitMask = Tag.trash
        }
        
        asset.physicsBody?.contactTestBitMask = Tag.player
        
        let randomPosition = GKRandomDistribution(lowestValue: 0, highestValue: Int(self.frame.size.width - 40))
        
        let randomRadian = GKRandomDistribution(lowestValue: 0, highestValue: 7)
        
        asset.position = CGPoint(x: CGFloat(randomPosition.nextInt()), y: self.frame.size.height)
        
        asset.zRotation = CGFloat(randomRadian.nextInt())
    
        asset.physicsBody?.isDynamic = true
        asset.physicsBody?.usesPreciseCollisionDetection = true
        
        asset.drawBorder(color: UIColor.red, width: 50)
        
        self.addChild(asset)
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        print("COLLISION")
        
        var player = contact.bodyA
        var other = contact.bodyB
        
        var isMillPart = false
       
        /*
        if (first.node?.name == "player" || second.node?.name == "player") {
            first.node?.physicsBody?.affectedByGravity = true;
            second.node?.physicsBody?.affectedByGravity = true;
            print("Collision!")
        }
         */
        
        if (player.categoryBitMask < Tag.player) {
            player = contact.bodyB
            other = contact.bodyA
        }
        
        if (other.categoryBitMask > Tag.player) {
            isMillPart = true
        } else {
            isMillPart = false
        }
        
        other.node?.removeFromParent()
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
