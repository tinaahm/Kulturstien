//
//  GameOverScene.swift
//  SkremBortHuldra
//
//  Created by Lucas on 23/05/2022.
//

import SpriteKit

class GameOverScene: SKScene {
    
    override func didMove(to view: SKView) -> Void {
        
        
        let endNode = SKLabelNode(fontNamed: "Chalkduster")
        endNode.fontSize = 30
        endNode.zPosition = 2
        endNode.position.x = frame.midX
        endNode.position.y = frame.midY + 70
        endNode.text = "Du ble tatt av Huldra!"
        
        let scoreNode = SKLabelNode(fontNamed: "Chalkduster")
        scoreNode.fontSize = 30
        scoreNode.zPosition = 2
        scoreNode.position.x = frame.midX
        scoreNode.position.y = frame.midY + 20
        scoreNode.text = "Poengsum: 0"

        
        let restartNode = SKLabelNode(fontNamed: "Chalkduster")
        restartNode.fontSize = 15
        restartNode.zPosition = 2
        restartNode.position.x = frame.midX
        restartNode.position.y = frame.midY - 40
        restartNode.text = "Klyp for å starte på nytt"
        
        addChild(endNode)
        addChild(scoreNode)
        addChild(restartNode)
        
        let pinchRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch))
        self.view?.addGestureRecognizer(pinchRecognizer)
    }
    
    @objc
    private func handlePinch(recognizer : UIPinchGestureRecognizer) -> Void {
        if recognizer.state == .ended {
            restart()
        }
    }
    
    private func restart() -> Void {
        let transition = SKTransition.fade(with: .white, duration: 3)
        let skView = view as! SKView
        let restartScene = GameScene(size: skView.bounds.size)
        restartScene.scaleMode = .fill
        self.view?.presentScene(restartScene, transition: transition)
    }
    
  /*init(size: CGSize, won:Bool) {
    super.init(size: size)
      
      let gameScore = GameScene()
      addChild(gameScore)
      
    
    // 1
    backgroundColor = SKColor.white
    
    // 2
      let message = won ? "Du er en helt!" : "Du traff \(gameScore.monstersDestroyed) ganger!"
    
    // 3
    let label = SKLabelNode(fontNamed: "Chalkduster")
    label.text = message
    label.fontSize = 40
    label.fontColor = SKColor.black
    label.position = CGPoint(x: size.width/2, y: size.height/2)
    addChild(label)
    
    // 4
    run(SKAction.sequence([
      SKAction.wait(forDuration: 5.0),
      SKAction.run() { [weak self] in
        // 5
        guard let `self` = self else { return }
        let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
        let scene = GameScene(size: size)
        self.view?.presentScene(scene, transition:reveal)
      }
      ]))
   }
  
  // 6
  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }*/
}

