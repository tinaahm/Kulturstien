//
//  GameScene.swift
//  SkremBortHuldra
//
//  Created by Lucas on 23/05/2022.
//

import SpriteKit
import SwiftUI

struct PhysicsCategory {
  static let none      : UInt32 = 0
  static let all       : UInt32 = UInt32.max
  static let monster   : UInt32 = 0b1       // 1
  static let projectile: UInt32 = 0b10      // 2
}

func +(left: CGPoint, right: CGPoint) -> CGPoint {
  return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

func -(left: CGPoint, right: CGPoint) -> CGPoint {
  return CGPoint(x: left.x - right.x, y: left.y - right.y)
}

func *(point: CGPoint, scalar: CGFloat) -> CGPoint {
  return CGPoint(x: point.x * scalar, y: point.y * scalar)
}

func /(point: CGPoint, scalar: CGFloat) -> CGPoint {
  return CGPoint(x: point.x / scalar, y: point.y / scalar)
}

#if !(arch(x86_64) || arch(arm64))
  func sqrt(a: CGFloat) -> CGFloat {
    return CGFloat(sqrtf(Float(a)))
  }
#endif

extension CGPoint {
  func length() -> CGFloat {
    return sqrt(x*x + y*y)
  }
  
  func normalized() -> CGPoint {
    return self / length()
  }
}

class GameScene: SKScene, ObservableObject {
	
	@Published var gameOverHuldra: Bool = false
    
	@Published var gameScore: SKLabelNode!
    
	@Published var monstersDestroyed = 0 {
                  didSet {
                      gameScore.text = "Poeng: \(monstersDestroyed)"
                  }
              }
	@Published var reset: Bool = false

    
  let player = SKSpriteNode(imageNamed: "TrondPlayer")
    
  override func didMove(to view: SKView) {/*
    // 2
    let background = SKSpriteNode(imageNamed: "background")
    background.blendMode = .replace
    background.zPosition = -1
    addChild(background)
      
    // 3
	  player.position = CGPoint(x: (size.width / 2), y: (size.height * 0.1))
      player.yScale = 0.35
      player.xScale = 0.35
      player.zPosition = 2
    // 4
    addChild(player)
    
    physicsWorld.gravity = .zero
    physicsWorld.contactDelegate = self
    
   run(SKAction.repeatForever(
          SKAction.sequence([
            SKAction.run(addMonster),
            SKAction.wait(forDuration: 0.430)
            ])
        ))
      
      gameScore = SKLabelNode(fontNamed: "Chalkduster")
      gameScore.text = "Poeng: 0"
      gameScore.position = CGPoint(x: (size.width / 2), y: 800)
      gameScore.fontSize = 25
      addChild(gameScore)*/
	  loadScene()
  }
	
	func loadScene()
		{
		  // 2
		  let background = SKSpriteNode(imageNamed: "background")
		  background.blendMode = .replace
		  background.zPosition = -1
		  addChild(background)
			
		  // 3
			player.position = CGPoint(x: (size.width / 2), y: (size.height * 0.1))
			player.yScale = 0.35
			player.xScale = 0.35
			player.zPosition = 2
		  // 4
		  addChild(player)
		  
		  physicsWorld.gravity = .zero
		  physicsWorld.contactDelegate = self
		  
		 run(SKAction.repeatForever(
				SKAction.sequence([
				  SKAction.run(addMonster),
				  SKAction.wait(forDuration: 0.430)
				  ])
			  ))
			
			gameScore = SKLabelNode(fontNamed: "Chalkduster")
			gameScore.text = "Poeng: 0"
			gameScore.position = CGPoint(x: (size.width / 2), y: 800)
			gameScore.fontSize = 25
			addChild(gameScore)
			
			resetGame()
		}
    
  
  func random() -> CGFloat {
    return CGFloat(Float(arc4random()) / Float(0xFFFFFFFF))
  }

  func random(min: CGFloat, max: CGFloat) -> CGFloat {
    return random() * (max - min) + min
  }

  func addMonster() {
    
    // Create sprite
    let monster = SKSpriteNode(imageNamed: "huldraliten")
    
    monster.physicsBody = SKPhysicsBody(rectangleOf: monster.size) // 1
    monster.physicsBody?.isDynamic = true // 2
    monster.physicsBody?.categoryBitMask = PhysicsCategory.monster // 3
    monster.physicsBody?.contactTestBitMask = PhysicsCategory.projectile // 4
    monster.physicsBody?.collisionBitMask = PhysicsCategory.none // 5
    
    // Determine where to spawn the monster along the X axis
	  let xPosition = random(min: 5, max: (size.width - 5))
    
    // Position the monster slightly off-screen along the top,
    // and along a random position along the X axis as calculated above
	  monster.position = CGPoint(x: xPosition, y: size.height)
    
    // Add the monster to the scene
    addChild(monster)
    
    // Determine speed of the monster
    let actualDuration = random(min: CGFloat(2.0), max: CGFloat(4.0))
    
    // Create the actions
	  let actionMove = SKAction.move(to: CGPoint(x: xPosition, y: (size.height * 0.1)),
                                   duration: TimeInterval(actualDuration))
    let actionMoveDone = SKAction.removeFromParent()
    
    let loseAction = SKAction.run() {
		self.gameOverHuldra = true
    }
    
    monster.run(SKAction.sequence([actionMove, loseAction, actionMoveDone]))
}

  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    // 1 - Choose one of the touches to work with
    guard let touch = touches.first else {
      return
}
    
    run(SKAction.playSoundFileNamed("Kastegaffel", waitForCompletion: false))

    let touchLocation = touch.location(in: self)
    
    // 2 - Set up initial location of projectile
    let projectile = SKSpriteNode(imageNamed: "Pitchfork")
    projectile.position = player.position
      projectile.yScale = 1.1
      projectile.xScale = 1.1
    
    projectile.physicsBody = SKPhysicsBody(circleOfRadius: projectile.size.width/2)
    projectile.physicsBody?.isDynamic = true
    projectile.physicsBody?.categoryBitMask = PhysicsCategory.projectile
    projectile.physicsBody?.contactTestBitMask = PhysicsCategory.monster
    projectile.physicsBody?.collisionBitMask = PhysicsCategory.none
    projectile.physicsBody?.usesPreciseCollisionDetection = true
    
    // 3 - Determine offset of location to projectile
    let offset = touchLocation - projectile.position
    
    // 4 - Bail out if you are shooting down or backwards
    if offset.y < 0 { return }
    
    // 5 - OK to add now - you've double checked position
    addChild(projectile)
    
    // 6 - Get the direction of where to shoot
    let direction = offset.normalized()
    
    // 7 - Make it shoot far enough to be guaranteed off screen
    let shootAmount = direction * 1000
    
    // 8 - Add the shoot amount to the current position
    let realDest = shootAmount + projectile.position
    
    // 9 - Create the actions
      let actionMove = SKAction.move(to: realDest, duration: 0.8)
    let actionMoveDone = SKAction.removeFromParent()
    projectile.run(SKAction.sequence([actionMove, actionMoveDone]))
  }
  
  func projectileDidCollideWithMonster(projectile: SKSpriteNode, monster: SKSpriteNode) {
      
    run(SKAction.playSoundFileNamed("huldraskutt", waitForCompletion: false))
    
    projectile.removeFromParent()
    monster.removeFromParent()

    
    monstersDestroyed += 1
    if monstersDestroyed > 99999 {
		self.gameOverHuldra = true
    }
	  if self.reset {
		  self.removeAllChildren()
		  self.removeAllActions()
		  self.loadScene()
	  }
  }

	func resetGame() {
		if self.reset {
			self.removeAllChildren()
			self.removeAllActions()
			self.loadScene()
		}
	}
	
}

extension GameScene: SKPhysicsContactDelegate {
  
  func didBegin(_ contact: SKPhysicsContact) {
	 // resetGame()
    // 1
    var firstBody: SKPhysicsBody
    var secondBody: SKPhysicsBody
    if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
      firstBody = contact.bodyA
      secondBody = contact.bodyB
    } else {
      firstBody = contact.bodyB
      secondBody = contact.bodyA
    }
   
    // 2
    if ((firstBody.categoryBitMask & PhysicsCategory.monster != 0) &&
        (secondBody.categoryBitMask & PhysicsCategory.projectile != 0)) {
      if let monster = firstBody.node as? SKSpriteNode,
        let projectile = secondBody.node as? SKSpriteNode {
        projectileDidCollideWithMonster(projectile: projectile, monster: monster)
      }
    }
  }
}
