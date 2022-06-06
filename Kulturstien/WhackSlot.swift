//
//  WhackSlot.swift
//  WhackANoekken
//
//  Created by Lucas on 19/05/2022.
//

import SpriteKit
import UIKit

class WhackSlot: SKNode {
    var charNode: SKSpriteNode!
    var random = [SKTexture]()
    
    var isVisible = false
    var isHit = false
    
    func configure(at position: CGPoint) {
        self.position = position
        
        let sprite = SKSpriteNode(imageNamed: "Group 69")
        //sprite.xScale = 1.15
        //sprite.yScale = 1.15
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
        
        random.append(SKTexture(imageNamed: "Cow"))
        random.append(SKTexture(imageNamed: "Reindeer"))
        random.append(SKTexture(imageNamed: "Bunny"))
        random.append(SKTexture(imageNamed: "Chicken"))
        let rand = Int(arc4random_uniform(UInt32(random.count)))
        let texture = random[rand] as SKTexture
        
        if isVisible { return }
        
        //charNode.xScale = 1.2
        //charNode.yScale = 1.2
        charNode.run(SKAction.moveBy(x: 0, y: 80, duration: 0.10))
        
        isVisible = true
        isHit = false
        
        if Int.random(in: 0...2) == 0 {
            charNode.texture = texture
            charNode.name = "charFriend"
        } else {
            charNode.texture = SKTexture(imageNamed: "nkken2")
            charNode.name = "charEnemy"
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + (hideTime * 3.0)) { [weak self] in
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
        
        let delay = SKAction.wait(forDuration: 0.5)
        let hide = SKAction.moveBy(x: 0, y:-80, duration:0.25)
        let notVisible = SKAction.run { [unowned self] in self.isVisible = false }
        charNode.run(SKAction.sequence([delay, hide, notVisible]))
    }
    
}
