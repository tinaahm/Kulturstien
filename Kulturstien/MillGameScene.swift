//
//  MillGameScene.swift
//  Kulturstien
//
//  Created by Embla on 01/06/2022.
//

//
// Sources:
//
// https://www.nicepng.com/ourpic/u2q8t4u2i1a9q8q8_wood-board-wooden-plank-panel-sign-wood-wo/
// https://www.vecteezy.com/free-vector/fishnet
// https://www.vecteezy.com/free-vector/nail
//

import GameplayKit
import SpriteKit
import SwiftUI

/// Bitmask for contact and collision detection
struct Tag
{
    static let trash: UInt32 = 0
    static let player: UInt32 = 0b1
    static let parts: UInt32 = 0b10
    static let other: UInt32 = 0b11
}

/// SpriteKit Scene for the mill game
class MillGameScene: SKScene, SKPhysicsContactDelegate, ObservableObject
{
    // Field accessed by View in MillGameView
	@Published var gameOver = false
    // Track points in MillGameView - store score outside of game
    @Published var partsCounter: Int = 0
	
    // Game rules
    var gravitySpeed: Int = 18
    var netMoveDelay: Double = 0.1
    var requiredParts: Int = 6
    
    // Should game stop or run?
    var isRunning: Bool = true
    
    // Reference generated nodes (for garbage collection)
    var nodes: [SKSpriteNode] = []
    
    // Game text
    let label = SKLabelNode(fontNamed: "Saira-Regular")
    var restartButton = SKSpriteNode()
    
    // Generated sprites' textures only load once
    let nailTexture = SKTexture(imageNamed: "nail")
    let plankTexture = SKTexture(imageNamed: "nice-plank")
    let smallTreeTexture = SKTexture(imageNamed: "TreeSmall")
    let bigTreeTexture = SKTexture(imageNamed: "TreeBig")
    
    let playerSprite: SKSpriteNode =
        SKSpriteNode(texture: SKTexture(imageNamed: "net"))
    
    /// Initial set-up, only runs once
    /// - Parameter view: single View
    override func didMove(to view: SKView)
    {
        size = view.frame.size
        
        backgroundColor = UIColor.init(Color("WaterColour"))
        
        physicsWorld.contactDelegate = self
        physicsWorld.gravity = CGVector(dx: 0, dy: -gravitySpeed)
        
        makePlayer()
        
        // Init restartbutton
        let systemRestart = UIImage(systemName: "arrow.clockwise")
        let data = systemRestart?.pngData()
        let image = UIImage(data: data!)
        let texture = SKTexture(image: image!)
        
        restartButton = SKSpriteNode(texture: texture, size: CGSize(width: 32, height: 32))
        restartButton.position = CGPoint(x: frame.midX, y: frame.midY)
        restartButton.alpha = 0
        restartButton.isUserInteractionEnabled = true

        addChild(restartButton)
    
        // Init text label
        label.fontSize = 30
        label.fontColor = SKColor.black
        label.position = CGPoint(x: frame.midX, y: frame.maxY - 100)
        addChild(label)
        
        // Generate assets
        Timer.scheduledTimer(timeInterval: 0.7, target: self, selector: #selector(generateRandomAsset), userInfo: nil, repeats: true)
        
        // Clean-up
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(collectTrash), userInfo: nil, repeats: true)
    }
    
    
    /// Called once per frame
    /// - Parameter currentTime: currentTime
    override func update(_ currentTime: TimeInterval)
    {
        // Print current score
        label.text = "Samlede deler: \(partsCounter) / \(requiredParts)"

        // Has player won?
        if (partsCounter >= requiredParts)
        {
            isRunning = false
            
            // Delete falling sprites, game is done
            for node in nodes
            {
                node.removeFromParent()
            }
            
            label.text = "Du klarte det!"
            
            restartButton.alpha = 100
			
            self.gameOver = true
        }
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
    
    /// Initial touch/tap
    /// - Parameters:
    ///   - touches: touches
    ///   - event: event
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for touch in touches
        {
            let coords: CGPoint = touch.location(in: self)
            let restartPos: CGPoint = restartButton.position
            
            playerSprite.run(SKAction.moveTo(x: coords.x, duration: netMoveDelay))
            
            if (isRunning) { return }
        
            let dx = coords.x - restartPos.x;
            let dy = coords.y - restartPos.y;
            let distance = sqrtf(Float(dx * dx + dy * dy));
            
            if (distance < 200)
            {
                reloadScene()
            }
        }
    }
    
    /// Touches were moved
    /// - Parameters:
    ///   - touches: touches
    ///   - event: event
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
    
    
    /// Programatically generate random assets, called periodically
    @objc private func generateRandomAsset()
    {
        // Don't run if game over
        if (!isRunning) { return }
        
        var asset: SKSpriteNode = SKSpriteNode()
            
        // Random index for which asset to generate
        let randomAssetNum = GKRandomDistribution(lowestValue: 0, highestValue: 4)
        let currentAssetNum = randomAssetNum.nextInt()
        
        // Is a mill part?
        if (currentAssetNum == 0 || currentAssetNum == 1)
        {
            if (currentAssetNum == 0)
            {
                asset = SKSpriteNode(texture: nailTexture)
                asset.size = CGSize(width: 14, height: 80)
            }
            
            if (currentAssetNum == 1)
            {
                asset = SKSpriteNode(texture: plankTexture)
                asset.size = CGSize(width: 68, height: 32)
            }
            
            asset.physicsBody = SKPhysicsBody(rectangleOf: asset.size)
            asset.physicsBody?.categoryBitMask = Tag.parts
        }
        
        // Is trash
        else
        {
            let randomTree = randomAssetNum.nextInt()
            
            if (randomTree < 3)
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
        
        // Detect contact and collision only with player
        asset.physicsBody?.contactTestBitMask = Tag.player
        asset.physicsBody?.collisionBitMask = Tag.player
        
        let randomPosition = GKRandomDistribution(lowestValue: 0, highestValue: Int(self.size.width - 40))
        
        asset.position = CGPoint(x: CGFloat(randomPosition.nextInt()), y: self.size.height)
        
        // Random rotation
        let randomRadian = GKRandomDistribution(lowestValue: 0, highestValue: 7)
        
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
    
    /// Reset game, reload scene manually
    private func reloadScene()
    {
        isRunning = true
        restartButton.alpha = 0
        partsCounter = 0
        
        for node in nodes
        {
            node.removeFromParent()
        }
     
        playerSprite.run(SKAction.moveTo(x: frame.midX, duration: 0))
    }
}
