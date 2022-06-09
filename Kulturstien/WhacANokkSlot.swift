//
//  WhacANokkSlot.swift
//
//  Created by Lucas on 19/05/2022.
//

import SpriteKit
import UIKit

class WhacANokkSlot: SKNode {
    var charNode: SKSpriteNode!
    var random = [SKTexture]()
    
    var isVisible = false
    var isHit = false
    
    func configure(at position: CGPoint) {
        self.position = position
        
        let sprite = SKSpriteNode(imageNamed: "WhacHole")
        addChild(sprite)
        
        let cropNode = SKCropNode()
        cropNode.position = CGPoint(x: 0, y: 15)
        cropNode.zPosition = 1.3
        cropNode.maskNode = SKSpriteNode(imageNamed: "whackMask")
        
        charNode = SKSpriteNode(imageNamed: "penguinGood")
        charNode.position = CGPoint(x: 0, y: -90)
        charNode.name = "character"
        cropNode.addChild(charNode)
        
        addChild(cropNode)
    }
    
    func show(hideTime: Double) {
        
        random.append(SKTexture(imageNamed: "CowGame"))
        random.append(SKTexture(imageNamed: "ReindeerGame"))
        random.append(SKTexture(imageNamed: "BunnyGame"))
        random.append(SKTexture(imageNamed: "ChickenGame"))
        let rand = Int(arc4random_uniform(UInt32(random.count)))
        let texture = random[rand] as SKTexture
        
        if isVisible { return }
        
        charNode.xScale = 1
        charNode.yScale = 1

        charNode.run(SKAction.moveBy(x: 0, y: 80, duration: 0.10))
        
        isVisible = true
        isHit = false
        
        if Int.random(in: 0...2) == 0 {
            charNode.texture = texture
            charNode.name = "charFriend"
        } else {
            charNode.texture = SKTexture(imageNamed: "NokkenGame")
            charNode.xScale = 0.8
            charNode.yScale = 0.8
            charNode.name = "charEnemy"
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + (hideTime * 2.0)) { [weak self] in
        self?.hide()
        }
    }
    
    func hide() {
        if !isVisible { return }
        
        charNode.run(SKAction.moveBy(x: 0, y:-80, duration:0.10))
        isVisible = false
    }
    
    func hit() {
        isHit = true
        
        charNode.xScale = 0.57
        charNode.yScale = 0.57
        let delay = SKAction.wait(forDuration: 0.05)
        let hide = SKAction.moveBy(x: 0, y:-80, duration:0.1)
        let notVisible = SKAction.run { [unowned self] in self.isVisible = false }
        charNode.run(SKAction.sequence([delay, hide, notVisible]))
    }
}
