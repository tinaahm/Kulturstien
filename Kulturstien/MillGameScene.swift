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
    static let player: UInt32 = 0b1
    static let parts: UInt32 = 0b10
    static let other: UInt32 = 0b11
}

class MillGameScene: SKScene, SKPhysicsContactDelegate {
    
    var nodes: [SKSpriteNode] = []
    
    let nailTexture = SKTexture(imageNamed: "nail")
    let plankTexture = SKTexture(imageNamed: "nice-plank")
    let paperTexture = SKTexture(imageNamed: "paper-brown")
    
    let playerSprite: SKSpriteNode =
        SKSpriteNode(texture: SKTexture(imageNamed: "net"))
    
    override func didMove(to view: SKView) {
        
        size = view.frame.size
        
        // backgroundColor = UIColor.init(Color("WaterColor"))
        backgroundColor = UIColor.systemBlue
        
        physicsWorld.contactDelegate = self
        physicsWorld.gravity = CGVector(dx: 0, dy: -5)
        
        makePlayer()
    
        // Generate assets
        Timer.scheduledTimer(timeInterval: 0.7, target: self, selector: #selector(generateRandomAsset), userInfo: nil, repeats: true)
        
        // Clean-up
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(collectTrash), userInfo: nil, repeats: true)
    }
    
    
    /// Scheduled clean-up of generated objects (SKSpriteNodes)
    @objc func collectTrash() {
        for node in nodes {
            if (node.position.y < self.size.height / 8) {
                node.removeFromParent()
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let coords = touch.location(in: self)
            
            playerSprite.run(SKAction.moveTo(x: coords.x, duration: 0.3))
        }

    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let coords = touch.location(in: self)
            
            playerSprite.run(SKAction.moveTo(x: coords.x, duration: 0.24))
        }
        
        print("player x-pos: \(playerSprite.position.x)")
    }
    
    func makePlayer() {
        playerSprite.size = CGSize(width: 100, height: 85)
        
        playerSprite.position = CGPoint(x: self.size.width / 2, y: self.size.height / 8)
        
        playerSprite.physicsBody = SKPhysicsBody(rectangleOf: playerSprite.size)
        playerSprite.physicsBody?.affectedByGravity = true
        playerSprite.physicsBody?.isDynamic = false
        
        playerSprite.name = "player"
        
        playerSprite.physicsBody?.categoryBitMask = Tag.player
        
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
        asset.physicsBody?.collisionBitMask = Tag.player
        
        let randomPosition = GKRandomDistribution(lowestValue: 0, highestValue: Int(self.size.width - 40))
        
        let randomRadian = GKRandomDistribution(lowestValue: 0, highestValue: 7)
        
        asset.position = CGPoint(x: CGFloat(randomPosition.nextInt()), y: self.size.height)
        
        asset.zRotation = CGFloat(randomRadian.nextInt())
    
        asset.physicsBody?.isDynamic = true
        
        self.addChild(asset)
        
        // Keep track of nodes, rm automatically
        nodes.append(asset)
    }
    
    /*
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
     */
    
    func didBegin(_ contact: SKPhysicsContact) {
        print("CONTACT")
        
        //var first = SKPhysicsBody()
        //var second = SKPhysicsBody()
        
        // if (contact.bodyA.node?.name == "player")
    }
}
