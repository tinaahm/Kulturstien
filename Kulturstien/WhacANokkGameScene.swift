//
//  WackGameScene.swift
//  WackANoekken
//
//  Created by Lucas on 24/05/2022.
//

import SpriteKit

class WhacANokkGameScene: SKScene, ObservableObject {
	@Published var gameOver: Bool = false
    
	var gameScore: SKLabelNode!
    var gameScore2: SKLabelNode!
	
	@Published var score = 0 {
        didSet {
            gameScore.text = "Score: \(score)"
        }
    }
    
    var slots = [WhacANokkSlot]()
    var popupTime = 0.85
    var numRounds = 0
    
    override func didMove(to view: SKView) {
      let background = SKSpriteNode(imageNamed: "13 Pro - 201")
        background.blendMode = .replace
        background.zPosition = -1
        addChild(background)
        

        gameScore = SKLabelNode(fontNamed: "Saira-Regular")
        gameScore.text = "Poeng: 0"
		gameScore.position = CGPoint(x: (size.width / 2), y: 750)
        gameScore.fontSize = 35
        addChild(gameScore)
		
		let halfOfScreenSize = (size.height / 2)
		let rowHeight = (halfOfScreenSize / 5)
		let nodeWidth = (size.width / 4)
        
        for i in 0 ..< 3 {
			createSlot(at: CGPoint(x: ((nodeWidth * 1) + (nodeWidth * CGFloat(i))), y: halfOfScreenSize - (rowHeight * 0)))
		}
		for i in 0 ..< 4 {
			createSlot(at: CGPoint(x: ((nodeWidth * 0.5) + (nodeWidth * CGFloat(i))), y: halfOfScreenSize - (rowHeight * 1)))
		}
		for i in 0 ..< 3 {
			createSlot(at: CGPoint(x: ((nodeWidth * 1) + (nodeWidth * CGFloat(i))), y: halfOfScreenSize - (rowHeight * 2)))
		}
		for i in 0 ..< 4 {
			createSlot(at: CGPoint(x: ((nodeWidth * 0.5) + (nodeWidth * CGFloat(i))), y: halfOfScreenSize - (rowHeight * 3)))
		}
		for i in 0 ..< 3 {
			createSlot(at: CGPoint(x: ((nodeWidth * 1) + (nodeWidth * CGFloat(i))), y: halfOfScreenSize - (rowHeight * 4)))
		}
        
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
                    let whacANokkSlot = node.parent!.parent as! WhacANokkSlot
                    if !whacANokkSlot.isVisible { continue }
                    if whacANokkSlot.isHit { continue }
                    
                    whacANokkSlot.hit()
                    score -= 3
                    
                    run(SKAction.playSoundFileNamed("whackBad.mp3", waitForCompletion:false))
                } else if node.name == "charEnemy" {
                    // they should have whacked this one
                    let whacANokkSlot = node.parent!.parent as! WhacANokkSlot
                    if !whacANokkSlot.isVisible { continue }
                    if whacANokkSlot.isHit { continue }
                    
					whacANokkSlot.hit()
                    score += 1
                    
                    run(SKAction.playSoundFileNamed("whack.mp3", waitForCompletion:false))
                }
            }
        }
    }
    
    func createSlot(at position: CGPoint) {
        let slot = WhacANokkSlot()
        slot.configure(at: position)
        addChild(slot)
        slots.append(slot)
    }
    
    func createEnemy() {
        numRounds += 1
        
        if numRounds >= 35 {
            for slot in slots {
                slot.hide()
            }
            
            numRounds = 0
			self.gameOver = true
        }
        
        popupTime *= 0.991
        
        slots.shuffle()
        slots[0].show(hideTime: popupTime)
        
        if Int.random(in: 0...12) > 4 { slots[1].show(hideTime: popupTime) }
        if Int.random(in: 0...12) > 8 { slots[2].show(hideTime: popupTime) }
        if Int.random(in: 0...12) > 10 { slots[3].show(hideTime: popupTime) }
        if Int.random(in: 0...12) > 11 { slots[4].show(hideTime: popupTime)  }
        
        let minDelay = popupTime / 2.0
		let maxDelay = popupTime * 2.0
        let delay = Double.random(in: minDelay...maxDelay)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) { [weak self] in
            self?.createEnemy()
        }
    }
}
