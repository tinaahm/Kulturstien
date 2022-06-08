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

class MillGameScene: SKScene, SKPhysicsContactDelegate
{
    var gravitySpeed: Int = 20
    var netMoveDelay: Double = 0.2
    
    var nodes: [SKSpriteNode] = []
    var partsCounter: Int = 0
    
    var requiredParts: Int = 6
    
    let label = SKLabelNode(fontNamed: "Source Sans Pro")
    
    let nailTexture = SKTexture(imageNamed: "nail")
    let plankTexture = SKTexture(imageNamed: "nice-plank")
    let smallTreeTexture = SKTexture(imageNamed: "small-tree")
    let bigTreeTexture = SKTexture(imageNamed: "big-tree")
    
    let playerSprite: SKSpriteNode =
        SKSpriteNode(texture: SKTexture(imageNamed: "net"))
    
    override func didMove(to view: SKView)
    {
        size = view.frame.size
        
        backgroundColor = UIColor.init(Color("WaterColor"))
        
        physicsWorld.contactDelegate = self
        physicsWorld.gravity = CGVector(dx: 0, dy: -gravitySpeed)
        
        makePlayer()
        
        // Init text label
        label.fontSize = 30
        label.fontColor = SKColor.black
        label.position = CGPoint(x: frame.midX, y: frame.maxY - 100)
        drawText()
        addChild(label)
    
        // Generate assets
        Timer.scheduledTimer(timeInterval: 0.7, target: self, selector: #selector(generateRandomAsset), userInfo: nil, repeats: true)
        
        // Clean-up
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(collectTrash), userInfo: nil, repeats: true)
    }
    
    override func update(_ currentTime: TimeInterval) {
        drawText()
    }
    
    func drawText()
    {
        label.text = "Samlede deler: \(partsCounter) / \(requiredParts)"
    }
    
    
    /// Scheduled clean-up of generated objects (SKSpriteNodes)
    @objc private func collectTrash()
    {
        for node in nodes
        {
            if (node.position.y < self.size.height / 8)
            {
                node.removeFromParent()
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for touch in touches
        {
            let coords = touch.location(in: self)
            
            playerSprite.run(SKAction.moveTo(x: coords.x, duration: netMoveDelay))
        }

    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for touch in touches
        {
            let coords = touch.location(in: self)
            playerSprite.run(SKAction.moveTo(x: coords.x, duration: netMoveDelay))
        }
    }
    
    /// Generate player object
    private func makePlayer()
    {
        playerSprite.size = CGSize(width: 100, height: 85)
        
        playerSprite.position = CGPoint(x: self.size.width / 2, y: self.size.height / 8)
        
        playerSprite.physicsBody = SKPhysicsBody(rectangleOf: playerSprite.size)
        playerSprite.physicsBody?.affectedByGravity = true
        playerSprite.physicsBody?.isDynamic = false
        
        playerSprite.name = "player"
        
        playerSprite.physicsBody?.categoryBitMask = Tag.player
        
        self.addChild(playerSprite)
    }
    
    
    /// Programatically generate random assets
    @objc private func generateRandomAsset()
    {
        let randomAssetNum = GKRandomDistribution(lowestValue: 0, highestValue: 4)
        
        var asset: SKSpriteNode
        
        let currentAsset = randomAssetNum.nextInt()
        
        if (currentAsset == 0)
        {
            asset = SKSpriteNode(texture: nailTexture)
            asset.size = CGSize(width: 14, height: 80)
            
            asset.physicsBody = SKPhysicsBody(rectangleOf: asset.size)
            asset.physicsBody?.categoryBitMask = Tag.parts
        }
        
        else if (currentAsset == 1)
        {
            asset = SKSpriteNode(texture: plankTexture)
            asset.size = CGSize(width: 68, height: 32)
            
            asset.physicsBody = SKPhysicsBody(rectangleOf: asset.size)
            asset.physicsBody?.categoryBitMask = Tag.parts
        }
        
        else
        {
            let randomTree = randomAssetNum.nextInt()
            
            if (randomTree < 4)
            {
                asset = SKSpriteNode(texture: smallTreeTexture)
                asset.size = CGSize(width: 60, height: 60)
            }
            
            else
            {
                asset = SKSpriteNode(texture: bigTreeTexture)
                asset.size = CGSize(width: 80, height: 80)
            }
        
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
    
    func didBegin(_ contact: SKPhysicsContact)
    {
        print("Contact")
        
        var other = SKPhysicsBody()
        
        // Contact assumes one body must be the player
        if (contact.bodyA.node?.name == "player")
        {
            other = contact.bodyB
        }
        else
        {
            other = contact.bodyA
        }
        
        // What collided?
        if (other.node?.physicsBody?.categoryBitMask == Tag.parts)
        {
            print("Found part!")
            
            print ("Number of parts: \(partsCounter)")
            
            if (partsCounter > 9)
            {
                // Game won
                partsCounter = 0
                
                if let scene = SKScene(fileNamed: "MillGameScene")
                {
                    scene.scaleMode = .fill
                    
                    view?.presentScene(scene)
                }
            }
            
            partsCounter += 1
        }
        
        else
        {
            reloadScene()
        }
        
        // Delete other item and sprite-node wrapper
        other.node?.parent?.removeFromParent()
        other.node?.removeFromParent()
    }
    
    private func reloadScene()
    {
        let screenSize: CGRect = UIScreen.main.bounds
        
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        size = CGSize(width: screenWidth, height: screenHeight)
        scaleMode = .fill
        
        view?.presentScene(MillGameScene())
    }
}
