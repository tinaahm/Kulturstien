//
//  WackGameScene.swift
//  WackANoekken
//
//  Created by Lucas on 24/05/2022.
//

import SpriteKit

class WackGameScene: SKScene, ObservableObject {
	@Published var gameOver: Bool = false
    
	var gameScore: SKLabelNode!
	
    var score = 0 {
        didSet {
            gameScore.text = "Score: \(score)"
        }
    }
    
    var slots = [WhackSlot]()
    var popupTime = 0.85
    var numRounds = 0
    
    override func didMove(to view: SKView) {
      /* let background = SKSpriteNode(imageNamed: "whackBackground2")
        //background.position = CGPoint(x: 0, y: 0)
        //background.yScale = 0.80
        //background.xScale = 0.80
        background.blendMode = .replace
        background.zPosition = -1
        addChild(background)*/
        
        gameScore = SKLabelNode(fontNamed: "Chalkduster")
        gameScore.text = "Score: 0"
        gameScore.position = CGPoint(x: -140, y: 260)
        gameScore.horizontalAlignmentMode = .left
        gameScore.fontSize = 60
        addChild(gameScore)
        
        for i in 0 ..< 3 { createSlot(at: CGPoint(x: -170 + (i * 170), y: -500)) }
        for i in 0 ..< 4 { createSlot(at: CGPoint(x: -250 + (i * 170), y: -390)) }
        for i in 0 ..< 3 { createSlot(at: CGPoint(x: -170 + (i * 170), y: -280)) }
        for i in 0 ..< 4 { createSlot(at: CGPoint(x: -250 + (i * 170), y: -170)) }
        for i in 0 ..< 3 { createSlot(at: CGPoint(x: -170 + (i * 170), y: -60)) }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.createEnemy()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            let tappedNodes = nodes(at: location)
            
            for node in tappedNodes {
                if node.name == "charFriend" {
                    // they shouldn't have whacked this char
                    let whackSlot = node.parent!.parent as! WhackSlot
                    if !whackSlot.isVisible { continue }
                    if whackSlot.isHit { continue }
                    
                    whackSlot.hit()
                    score -= 3
                    
                    run(SKAction.playSoundFileNamed("whackBad.mp3", waitForCompletion:false))
                } else if node.name == "charEnemy" {
                    // they should have whacked this one
                    let whackSlot = node.parent!.parent as! WhackSlot
                    if !whackSlot.isVisible { continue }
                    if whackSlot.isHit { continue }
                    
                    whackSlot.charNode.xScale = 0.90
                    whackSlot.charNode.yScale = 0.90
                    
                    whackSlot.hit()
                    score += 1
                    
                    run(SKAction.playSoundFileNamed("whack.mp3", waitForCompletion:false))
                }
            }
        }
    }
    
    func createSlot(at position: CGPoint) {
        let slot = WhackSlot()
        slot.configure(at: position)
        addChild(slot)
        slots.append(slot)
    }
    
    func createEnemy() {
        numRounds += 1
        
        if numRounds == 3 {
            for slot in slots {
                slot.hide()
            }
            
            numRounds = 0
            /*let scene = GameScene(size: self.size)
            scene.scaleMode = .aspectFill
            let animation = SKTransition.fade(withDuration: 1.0)
            self.view?.presentScene(scene, transition: animation)
            self.removeAllChildren()
            self.removeAllActions()
            self.scene?.removeFromParent()
            */
            
            /*let reveal = SKTransition.flipVertical(withDuration: 1.0)
            let gameOverScene = WackGameOverScene(size: size)
            view?.presentScene(gameOverScene, transition: reveal)*/
			
			self.gameOver = true
        }
        
        popupTime *= 0.980
        
        slots.shuffle()
        slots[0].show(hideTime: popupTime)
        
        if Int.random(in: 0...12) > 4 { slots[1].show(hideTime: popupTime) }
        if Int.random(in: 0...12) > 8 { slots[2].show(hideTime: popupTime) }
        if Int.random(in: 0...12) > 10 { slots[3].show(hideTime: popupTime) }
        if Int.random(in: 0...12) > 11 { slots[4].show(hideTime: popupTime)  }
        
        let minDelay = popupTime / 2.0
        let maxDelay = popupTime * 2
        let delay = Double.random(in: minDelay...maxDelay)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) { [weak self] in
            self?.createEnemy()
        }
    }
}
